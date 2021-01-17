//
//  LoginPresenter.swift
//  
//
//  Created by 이재은 on 2021/01/17.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol LoginPresenterInput: LoginInteractorOutput {

}

protocol LoginPresenterOutput: class {

    func displaySomething(viewModel: LoginViewModel)
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

    func presentSomething() {

        // TODO: Format the response from the Interactor and pass the result back to the View Controller

        let viewModel = LoginViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
