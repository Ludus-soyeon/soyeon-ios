//
//  NewAccountInteractor.swift
//  Soyeon
//
//  Created by junyng on 2021/01/17.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

protocol NewAccountInteractorInput: NewAccountInteractorOutput {

}

protocol NewAccountInteractorOutput {
    func presentNewAccount()
}

final class NewAccountInteractor {
    let output: NewAccountInteractorOutput
    let worker: NewAccountWorker
    
    // MARK: - Initializers
    init(output: NewAccountInteractorOutput, worker: NewAccountWorker = NewAccountWorker()) {
        self.output = output
        self.worker = worker
    }
}

// MARK: - NewAccountInteractorInteractorInput
extension NewAccountInteractor: NewAccountViewControllerOutput {
    // MARK: - Business logic
    func displayNewAccount() {
        output.presentNewAccount()
    }
}
