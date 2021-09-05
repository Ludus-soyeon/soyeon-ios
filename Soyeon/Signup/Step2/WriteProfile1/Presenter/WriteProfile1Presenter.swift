//
//  WriteProfile1Presenter.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/18.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

protocol WriteProfile1PresenterInput: WriteProfile1InteractorOutput {

}

protocol WriteProfile1PresenterOutput: AnyObject { 
    func displayWriteProfileOnLoad(response: WriteProfile1Model.ViewModel)
}

final class WriteProfile1Presenter {

    private(set) weak var output: WriteProfile1PresenterOutput!

    // MARK: - Initializers

    init(output: WriteProfile1PresenterOutput) {

        self.output = output
    }
}
 
// MARK: - WriteProfile1PresenterInput

extension WriteProfile1Presenter: WriteProfile1PresenterInput {
    // MARK: - Presentation logic
    func presentWriteProfile(response: WriteProfile1Model.ViewModel) {
        output.displayWriteProfileOnLoad(response: response)
    }
}
