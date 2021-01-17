//
//  LoginPresenter.swift
//  Soyeon
//
//  Created by 이재은 on 2021/01/02.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

protocol LoginPresenterInput: LoginInteractorOutput {

}

protocol LoginPresenterOutput: class {
    func displayLoginTableView(viewModel: Login.LoginViewModel)
}

final class LoginPresenter {

    private(set) weak var output: LoginPresenterOutput!

    // MARK: - Initializers
    init(output: LoginPresenterOutput) {
        self.output = output
    }
}

// MARK: - LoginPresenterInput
extension LoginPresenter: LoginPresenterInput {

    // MARK: - Presentation logic
    func presentLogin(platform: [Login.Platform]) {
        let viewModel = Login.LoginViewModel(platforms: platform)
        output.displayLoginTableView(viewModel: viewModel)
    }
}

