//
//  NewAccountViewController.swift
//  Soyeon
//
//  Created by junyng on 2021/01/17.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

protocol NewAccountViewControllerInput: NewAccountPresenterOutput {

}

protocol NewAccountViewControllerOutput {
    func displayNewAccount(gender: NewAccount.GenderType)
}

final class NewAccountViewController: SignupStepViewController<NewAccount.ViewData> {
    private lazy var _viewData: NewAccount.ViewData = loadViewData() ?? .init() {
        willSet { setViewData(newValue) }
    }
     
    @IBOutlet private weak var genderInputStackView: UIStackView!
    @IBOutlet private weak var authNumberInputStackView: UIStackView!
    @IBOutlet private weak var authNumberInputSeparatorView: UIView!
    @IBOutlet private weak var authDurationLabel: UILabel!
    @IBOutlet private weak var sendAuthNumberButton: UIButton!
    @IBOutlet private weak var authButton: UIButton!
    
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var nickNameTextField: UITextField!
    @IBOutlet private weak var phoneNumberTextField: UITextField!
    
    var output: NewAccountViewControllerOutput!
    var router: NewAccountRouterProtocol!

    // MARK: - Initializers

    init(configurator: NewAccountConfigurator = NewAccountConfigurator.shared) {
        super.init(nibName: nil, bundle: nil)
        configure()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }

    // MARK: - Configurator
    private func configure(configurator: NewAccountConfigurator = NewAccountConfigurator.shared) {
        configurator.configure(viewController: self)
    }

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         fillViewData(_viewData)
    }
    
    private func setupLayout() {
        setNavigationTitle("회원가입")
        sendAuthNumberButton.layer.borderColor = Colors.soyeonBlue.color().cgColor
        authButton.layer.borderColor = Colors.soyeonBlue.color().cgColor
    }
    
    private func fillViewData(_ data: NewAccount.ViewData) {
        nameTextField.text = data.name
        nickNameTextField.text = data.nickName
        phoneNumberTextField.text = data.phoneNumber
        output.displayNewAccount(gender: data.gender ?? .male)
    }
    
    @IBAction private func sendAuthNumberButtonTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.35) { [weak self] in
            self?.authNumberInputStackView.isHidden = false
            self?.authNumberInputStackView.alpha = 1
            self?.authNumberInputSeparatorView.isHidden = false
            self?.authNumberInputSeparatorView.alpha = 1
        } completion: { _ in
            UIView.animate(withDuration: 0.25) { [weak self] in
                self?.authDurationLabel.isHidden = false
                self?.authDurationLabel.alpha = 1
            }
        }
    }
    
    @IBAction func didTapRegisterAccountButton(_ sender: Any) {  
        var user = SYDefaultObject.user ?? User()
        
        user.name = _viewData.name
        user.nickName = _viewData.nickName
        user.sex = _viewData.gender?.boolValue
        user.phone = _viewData.phoneNumber
        
        SYDefaultObject.user = user
        
        router.navigateToPhase()
        return
        
    }
}

// MARK: - ViewData
extension NewAccountViewController: UITextFieldDelegate, RadioGroupDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        let text = textField.text
        switch textField {
        case nameTextField:
            _viewData.name = text
        case nickNameTextField:
            _viewData.nickName = text
        case phoneNumberTextField:
            _viewData.phoneNumber = text
        default:
            break
        }
    }
     
    func radioButtonDidTap(_ sender: RadioButton) {
        if let gender = NewAccount.GenderType(rawValue: sender.tag) {
            _viewData.gender = gender
        }
    }
}

// MARK: - NewAccountViewControllerPresenterOutput
extension NewAccountViewController: NewAccountViewControllerInput {

    // MARK: - Display logic
    func displayNewAccountView(viewModel: NewAccount.NewAccountViewModel) {
        let genderTypes = NewAccount.GenderType.allCases.map { String(describing: $0) }
        let radioGroup = RadioGroup(items: genderTypes,
                                    selectedIndex: viewModel.genderType.rawValue)
        radioGroup.delegate = self
        genderInputStackView.addArrangedSubview(radioGroup)
    }
}
 
