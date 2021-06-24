//
//  CheckMyCharacterPresenter.swift
//  Soyeon
//
//  Created by 박은비 on 2021/05/26.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

protocol CheckMyCharacterPresenterInput: CheckMyCharacterInteractorOutput {

}

protocol CheckMyCharacterPresenterOutput: class {

    func displaySomething(viewModel: CheckMyCharacterViewModel)
}

final class CheckMyCharacterPresenter {

    private(set) weak var output: CheckMyCharacterPresenterOutput!

    // MARK: - Initializers

    init(output: CheckMyCharacterPresenterOutput) {

        self.output = output
    }
}
 
// MARK: - CheckMyCharacterPresenterInput

extension CheckMyCharacterPresenter: CheckMyCharacterPresenterInput {
 
    // MARK: - Presentation logic

    func presentSomething() {
        let viewModel = CheckMyCharacterViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
