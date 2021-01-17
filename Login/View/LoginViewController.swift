//
//  LoginViewController.swift
//  
//
//  Created by 이재은 on 2021/01/17.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol LoginViewControllerInput: LoginPresenterOutput {

}

protocol LoginViewControllerOutput {

    func doSomething()
}

final class LoginViewController: UIViewController {

    var output: LoginViewControllerOutput!
    var router: LoginRouterProtocol!


    // MARK: - Initializers

    init(configurator: LoginConfigurator = LoginConfigurator.sharedInstance) {

        super.init(nibName: nil, bundle: nil)

        configure()
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        configure()
    }


    // MARK: - Configurator

    private func configure(configurator: LoginConfigurator = LoginConfigurator.sharedInstance) {

        configurator.configure(viewController: self)
    }


    // MARK: - View lifecycle

    override func viewDidLoad() {

        super.viewDidLoad()

        doSomethingOnLoad()
    }


    // MARK: - Load data

    func doSomethingOnLoad() {

        // TODO: Ask the Interactor to do some work

        output.doSomething()
    }
}


// MARK: - LoginPresenterOutput

extension LoginViewController: LoginViewControllerInput {


    // MARK: - Display logic

    func displaySomething(viewModel: LoginViewModel) {

        // TODO: Update UI
    }
}
