//
//  GuidancePresenter.swift
//  Soyeon
//
//  Created by 이재은 on 2020/12/25.
//  Copyright (c) 2020 ludus. All rights reserved.
//

import UIKit

protocol GuidancePresenterInput: GuidanceInteractorOutput {

}

protocol GuidancePresenterOutput: class {

    func displayGuidance(viewModel: Guidance.GuidanceViewModel)
}

final class GuidancePresenter {

    private(set) weak var output: GuidancePresenterOutput!

    // MARK: - Initializers
    init(output: GuidancePresenterOutput) {
        self.output = output
    }
}

// MARK: - GuidancePresenterInput
extension GuidancePresenter: GuidancePresenterInput {

    // MARK: - Presentation logic
    func presentGuidance(type: Guidance.GuidanceType) {
        let viewModel = Guidance.GuidanceViewModel(title: type.title,
                                                   content: type.content,
                                                   imageName: type.imageName,
                                                   buttonText: type.buttonText)
        output.displayGuidance(viewModel: viewModel)
    }
}

