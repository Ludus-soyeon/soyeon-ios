//
//  LoginViewController.swift
//  Soyeon
//
//  Created by 이재은 on 2021/01/02.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

protocol LoginViewControllerInput: LoginPresenterOutput {

}

protocol LoginViewControllerOutput {
    func displayLoginOnLoad()
}

final class LoginViewController: UIViewController {

    var output: LoginViewControllerOutput!
    var router: LoginRouterProtocol!

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Initializers
    init(configurator: LoginConfigurator = LoginConfigurator.shared) {
        super.init(nibName: nil, bundle: nil)

        configure()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        configure()
    }

    // MARK: - Configurator
    private func configure(configurator: LoginConfigurator = LoginConfigurator.shared) {
        configurator.configure(viewController: self)
    }

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        doLoginOnLoad()
    }

    // MARK: - Load data
    func doLoginOnLoad() {
        output.displayLoginOnLoad()
    }

    // MARK: - Function
    private func didTappedNaver() {

    }

    private func didTappedKakao() {

    }

    private func didTappedGoggle() {

    }

    private func didTappedApple() {

    }
}

// MARK: - LoginPresenterOutput
extension LoginViewController: LoginViewControllerInput {

    // MARK: - Display logic
    func displayLoginTableView(viewModel: Login.LoginViewModel) {

    }
}

// MARK: - UITableViewDataSource
extension LoginViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let platformCell = tableView
                .dequeueReusableCell(withIdentifier: "LoginPlatformCell",
                                     for: indexPath) as? LoginPlatformCell else {
            return UITableViewCell()
        }

        if let platform = Login.Platform(rawValue: indexPath.row) {
            platformCell.setProperties(platform)
        }

        return platformCell
    }
}

// MARK: - UITableViewDelegate
extension LoginViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            didTappedNaver()
        case 1:
            didTappedKakao()
        case 2:
            didTappedGoggle()
        case 3:
            didTappedApple()
        default:
            break
        }
    }
}

