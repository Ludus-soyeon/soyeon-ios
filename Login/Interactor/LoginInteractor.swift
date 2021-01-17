//
//  LoginInteractor.swift
//  
//
//  Created by 이재은 on 2021/01/17.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol LoginInteractorInput: LoginViewControllerOutput {

}

protocol LoginInteractorOutput {

    func presentSomething()
}

final class LoginInteractor {

    let output: LoginInteractorOutput
    let worker: LoginWorker


    // MARK: - Initializers

    init(output: LoginInteractorOutput, worker: LoginWorker = LoginWorker()) {

        self.output = output
        self.worker = worker
    }
}


// MARK: - LoginInteractorInput

extension LoginInteractor: LoginViewControllerOutput {


    // MARK: - Business logic

    func doSomething() {

        // TODO: Create some Worker to do the work

        worker.doSomeWork()

        // TODO: Pass the result to the Presenter

        output.presentSomething()
    }
}
