//
//  AdditionalInteractor.swift
//  Soyeon
//
//  Created by 이재은 on 2021/03/08.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

protocol AdditionalInteractorInput: AdditionalViewControllerOutput {

}

protocol AdditionalInteractorOutput {

    func presentAdditionalList(list: [AdditionalMatch.AdditionalMatchingType])
}

final class AdditionalInteractor {

    let output: AdditionalInteractorOutput
    let worker: AdditionalWorker

    // MARK: - Initializers

    init(output: AdditionalInteractorOutput,
         worker: AdditionalWorker = AdditionalWorker()) {

        self.output = output
        self.worker = worker
    }
}

// MARK: - AdditionalInteractorInput

extension AdditionalInteractor: AdditionalViewControllerOutput {
    // MARK: - Business logic
    func doAdditionalMatchListOnLoad() {
        let matchType: [AdditionalMatch.AdditionalMatchingType] = [.top10, .personality, .physical,
                                                                   .lately, .neighborhood, .job,
                                                                   .recommend, .religion, .interest, .random]
        output.presentAdditionalList(list: matchType)
    }
}
