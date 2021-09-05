//
//  LoginViewController.swift
//  Soyeon
//
//  Created by 이재은 on 2021/01/02.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit
import AppAuth

protocol LoginViewControllerInput: LoginPresenterOutput {

}

protocol LoginViewControllerOutput {
    func displayLoginOnLoad()
}

final class LoginViewController: SignupStepViewController<EmptySignupData> {
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
 
    @IBAction func didTap(_ sender: Any) {
        router.routeToPrivatePolicy()
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
        return Login.Platform.allCases.count
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
        guard let platform = Login.Platform(rawValue: indexPath.row) else {
            return
        }
        
        var auth: AuthInfo
        
        switch platform {
        case .naver:
            auth = NIDAuth(presenter: self)
        case .kakao:
            auth = KKOIDAuth()
        case .google:
            auth = GIDAuth(presenter: self)
        case .apple:
            auth = APIDAuth()
        }
        
        auth.authorization(success: { token in
            print(.success, token ?? "Not found token.")
        })
        
    }
}
 
