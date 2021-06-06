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

protocol PhotoRegistrationPresenterOutput: AnyObject {

    func displaySomething(response: PhotoRegistrationViewModel)
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

    func presentProfileImage(response: PhotoRegistrationViewModel) {

        output.displaySomething(response: response)
    }
}
