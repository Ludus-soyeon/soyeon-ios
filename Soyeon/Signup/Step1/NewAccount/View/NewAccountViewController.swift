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
    func displayNewAccount()
}

final class NewAccountViewController: UIViewController {
    
    @IBOutlet private weak var genderInputStackView: UIStackView!
    @IBOutlet private weak var authNumberInputStackView: UIStackView!
    @IBOutlet private weak var authNumberInputSeparatorView: UIView!
    @IBOutlet private weak var authDurationLabel: UILabel!
    @IBOutlet private weak var sendAuthNumberButton: UIButton!
    @IBOutlet private weak var authButton: UIButton!
    
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
        output.displayNewAccount()
    }
    
    private func setupLayout() {
        setNavigationTitle("회원가입")
        sendAuthNumberButton.layer.borderColor = Colors.soyeonBlue.color().cgColor
        authButton.layer.borderColor = Colors.soyeonBlue.color().cgColor
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
}

// MARK: - NewAccountViewControllerPresenterOutput
extension NewAccountViewController: NewAccountViewControllerInput {

    // MARK: - Display logic
    func displayNewAccountView(viewModel: NewAccount.NewAccountViewModel) {
        let genderTypes = NewAccount.GenderType.allCases.map { String(describing: $0) }
        let radioGroup = RadioGroup(items: genderTypes,
                                    selectedIndex: viewModel.genderType.rawValue)
        genderInputStackView.addArrangedSubview(radioGroup)
    }
}
