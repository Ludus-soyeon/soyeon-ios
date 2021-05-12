//
//  NewAccountPresenter.swift
//  Soyeon
//
//  Created by junyng on 2021/01/17.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

protocol NewAccountPresenterInput: NewAccountInteractorOutput {

}

protocol NewAccountPresenterOutput: class {
    func displayNewAccountView(viewModel: NewAccount.NewAccountViewModel)
}

final class NewAccountPresenter {
    private(set) weak var output: NewAccountPresenterOutput!
    // MARK: - Initializers
    init(output: NewAccountPresenterOutput) {
        self.output = output
    }
}

// MARK: - NewAccountPresenterPresenterInput
extension NewAccountPresenter: NewAccountPresenterInput {
    // MARK: - Presentation logic
    func presentNewAccount(gender: NewAccount.GenderType) {
        let viewModel = NewAccount.NewAccountViewModel(genderType: gender)
        output.displayNewAccountView(viewModel: viewModel)
    }
}
