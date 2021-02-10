//
//  LoginConfigurator.swift
//  Soyeon
//
//  Created by 이재은 on 2021/01/02.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

final class LoginConfigurator {

    // MARK: - Singleton
    static let shared: LoginConfigurator = LoginConfigurator()

    // MARK: - Configuration

    func configure(viewController: LoginViewController) {
        let router = LoginRouter(viewController: viewController)
        let presenter = LoginPresenter(output: viewController)
        let interactor = LoginInteractor(output: presenter)

        viewController.output = interactor
        viewController.router = router
    }
}
