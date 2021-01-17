//
//  LoginConfigurator.swift
//  
//
//  Created by 이재은 on 2021/01/17.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class LoginConfigurator {


    // MARK: - Singleton

    static let sharedInstance: LoginConfigurator = LoginConfigurator()


    // MARK: - Configuration

    func configure(viewController: LoginViewController) {

        let router = LoginRouter(viewController: viewController)
        let presenter = LoginPresenter(output: viewController)
        let interactor = LoginInteractor(output: presenter)

        viewController.output = interactor
        viewController.router = router
    }
}
