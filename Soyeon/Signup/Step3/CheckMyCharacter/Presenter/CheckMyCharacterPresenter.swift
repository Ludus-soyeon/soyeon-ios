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

protocol CheckMyCharacterPresenterOutput: AnyObject {

    func displayQuestions(_ questions: [MQuestion])
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

    func presentMbti(_ mbti: Mbti) {
        output.displayQuestions(mbti.questions)
    }
}
