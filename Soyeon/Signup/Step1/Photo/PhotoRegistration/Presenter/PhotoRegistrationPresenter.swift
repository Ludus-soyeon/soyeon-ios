//
//  PhotoRegistrationPresenter.swift
//  Soyeon
//
//  Created by 이재은 on 2021/02/07.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

protocol PhotoRegistrationPresenterInput: PhotoRegistrationInteractorOutput {

}

protocol PhotoRegistrationPresenterOutput: class {

    func displaySomething(viewModel: PhotoRegistrationViewModel)
}

final class PhotoRegistrationPresenter {

    private(set) weak var output: PhotoRegistrationPresenterOutput!


    // MARK: - Initializers

    init(output: PhotoRegistrationPresenterOutput) {

        self.output = output
    }
}


// MARK: - PhotoRegistrationPresenterInput

extension PhotoRegistrationPresenter: PhotoRegistrationPresenterInput {


    // MARK: - Presentation logic

    func presentSomething() {

        let viewModel = PhotoRegistrationViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
