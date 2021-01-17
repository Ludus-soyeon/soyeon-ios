//
//  LoginRouter.swift
//  
//
//  Created by 이재은 on 2021/01/17.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol LoginRouterProtocol {

    var viewController: LoginViewController? { get }

    func navigateToSomewhere()
}

final class LoginRouter {

    weak var viewController: LoginViewController?


    // MARK: - Initializers

    init(viewController: LoginViewController?) {

        self.viewController = viewController
    }
}


// MARK: - LoginRouterProtocol

extension LoginRouter: LoginRouterProtocol {


    // MARK: - Navigation

    func navigateToSomewhere() {

    }
}
