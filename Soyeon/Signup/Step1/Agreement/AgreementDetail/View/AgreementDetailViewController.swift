//
//  AgreementDetailViewController.swift
//  Soyeon
//
//  Created by 박은비 on 2021/01/02.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

protocol AgreementDetailViewControllerInput: AgreementDetailPresenterOutput {

}

protocol AgreementDetailViewControllerOutput {

    func doAgreementDetailOnLoad(reqeust: AgreementDetail.Request)
}

final class AgreementDetailViewController: UIViewController {
    
    @IBOutlet private weak var navigationTitle: UILabel!
    @IBOutlet private weak var contentTextView: UITextView!
    
    var detailType: AgreementDetail.AgreementDetailType!
    
    var output: AgreementDetailViewControllerOutput!
    var router: AgreementDetailRouterProtocol!
 
    // MARK: - Initializers

    init(type: AgreementDetail.AgreementDetailType,
         configurator: AgreementDetailConfigurator = AgreementDetailConfigurator.shared) {
        
        super.init(nibName: nil, bundle: nil)
        
        configure()
        
        detailType = type
        
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        configure()
    }
 
    // MARK: - Configurator
    private func configure(configurator: AgreementDetailConfigurator = AgreementDetailConfigurator.shared) {

        configurator.configure(viewController: self)
    }
 
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        contentTextView.contentInset = UIEdgeInsets.init(top: 26, left: 42, bottom: 26, right: 42)
        
        doAgreementDetailOnLoad()
    }
    
    // MARK: - Load data
    func doAgreementDetailOnLoad() {
        output.doAgreementDetailOnLoad(reqeust: AgreementDetail.Request(detailType: detailType))
    }
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        router.navigateToPop() 
    }
     
}

// MARK: - AgreementDetailPresenterOutput
extension AgreementDetailViewController: AgreementDetailViewControllerInput {
    // MARK: - Display logic
    func displayAgreementDetail(viewModel: AgreementDetail.AgreementDetailViewModel) {
        navigationTitle.text = viewModel.title
        contentTextView.text = viewModel.content
    }
}
