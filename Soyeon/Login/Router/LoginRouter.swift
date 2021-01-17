//
//  LoginRouter.swift
//  Soyeon
//
//  Created by 이재은 on 2021/01/02.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

protocol LoginRouterProtocol {
    var viewController: LoginViewController? { get }

    func routeToPrivatePolicy()
}

final class LoginRouter {

    weak var viewController: LoginViewController?

    // MARK: - Initializers
    init(viewController: LoginViewController?) {
        self.viewController = viewController
    }

    // MARK: - Navigation
    private func navigateToPrivacyPolicy(source: LoginViewController,
                                         destination: LoginViewController) {
        source.navigationController?.pushViewController(destination, animated: true)
    }
}

// MARK: - LoginRouterProtocol
extension LoginRouter: LoginRouterProtocol {

    func routeToPrivatePolicy() { // destination 추후 변경
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        if let destinationVC = storyboard
            .instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
            navigateToPrivacyPolicy(source: viewController!, destination: destinationVC)
        }
    }
}

