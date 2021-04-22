//
//  AgreementViewController.swift
//  Soyeon
//
//  Created by 박은비 on 2020/12/23.
//  Copyright (c) 2020 ludus. All rights reserved.
//

import UIKit

protocol AgreementViewControllerInput: AgreementPresenterOutput {
}

protocol AgreementViewControllerOutput {
    func updateAgreements(_ request: Agreement.Request)
    func loadViewData(_ data: Agreement.Agreements)
}
 
final class AgreementViewController: SignupStepViewController<Agreement.Agreements> {

    
    fileprivate var viewData: ViewDataType = .init() {
        willSet {
            setViewData(newValue)
        }
    }
     
    @IBOutlet private weak var allAgreeLabel: UILabel!
    @IBOutlet private weak var allAgreeButton: UIButton!
    @IBOutlet private weak var privacyAgreeButton: UIButton!
    @IBOutlet private weak var serviceAgreeButton: UIButton!
    @IBOutlet private weak var marketingAgreeButton: UIButton!
    @IBOutlet private weak var joinButton: UIButton!
     
    fileprivate var viewModel: Agreement.AgreementViewModel = Agreement.AgreementViewModel() {
        willSet {  viewData = newValue.agreements }
    }
    
    var output: AgreementViewControllerOutput!
    var router: AgreementRouterProtocol!

    // MARK: - Initializers

    init(configurator: AgreementConfigurator = AgreementConfigurator.shared) {
        
        super.init(nibName: nil, bundle: nil)

        configure()
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        configure()
    }

    // MARK: - Configurator

    private func configure(configurator: AgreementConfigurator = AgreementConfigurator.shared) {

        configurator.configure(viewController: self)
    }

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         
        if let viewData = loadViewData() {
            self.viewData = viewData
            fillViewData(viewData)
        }
    }
    
    private func setupLayout() {
        setNavigationTitle("이용 약관 동의")
    }
    
    private func fillViewData(_ data: ViewDataType) {
        output.loadViewData(viewData)
    }
    
    @IBAction func agreeButtonDidTap(_ sender: UIButton) {
        if let type = Agreement.AgreementButtonTag(rawValue: sender.tag) {
            let state = viewModel.getButtonState(type)
             
            output.updateAgreements(Agreement.Request(agreements: viewModel.agreements,
                                                      buttonType: type,
                                                      state: state))
        }
        
    }
    
    @IBAction func detailButtonDidTap(_ sender: UIButton) {
        if let type = Agreement.AgreementButtonTag(rawValue: sender.tag) {
            router.navigateToAgreementDetail(type: type)
        }
    }
    
    @IBAction func joinButtonDidTap(_ sender: UIButton) {
        if sender.isSelected {
            router.navigateToNewAccount()
        }
    }
    
}

// MARK: - AgreementPresenterOutput
extension AgreementViewController: AgreementViewControllerInput {
    // MARK: - Display logic

    func display(viewModel: Agreement.AgreementViewModel) {
        self.viewModel = viewModel

        allAgreeButton.isSelected = viewModel.agreements.all
        allAgreeLabel.textColor = viewModel.agreements.all ? #colorLiteral(red: 0.4117647059, green: 0.4666666667, blue: 0.8941176471, alpha: 1): #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)  
        privacyAgreeButton.isSelected = viewModel.agreements.privacy
        serviceAgreeButton.isSelected = viewModel.agreements.service
        marketingAgreeButton.isSelected = viewModel.agreements.marketing
        
        joinButton.isSelected = viewModel.agreements.all
          
    }
}
