//
//  GuidanceInteractor.swift
//  Soyeon
//
//  Created by 이재은 on 2020/12/25.
//  Copyright (c) 2020 ludus. All rights reserved.
//

import UIKit

protocol GuidanceInteractorInput: GuidanceViewControllerOutput {

}

protocol GuidanceInteractorOutput {
    func presentGuidance(type: Guidance.GuidanceType)
}

final class GuidanceInteractor {

    let output: GuidanceInteractorOutput
    let worker: GuidanceWorker

    // MARK: - Initializers
    init(output: GuidanceInteractorOutput,
         worker: GuidanceWorker = GuidanceWorker()) {
        self.output = output
        self.worker = worker
    }
}

// MARK: - GuidanceInteractorInput
extension GuidanceInteractor: GuidanceViewControllerOutput {

    // MARK: - Business logic

    func doGuidanceOnLoad() {
        let guidanceType = worker.setGuidanceType(Guidance.GuidanceType.signupWating)
        output.presentGuidance(type: guidanceType)
    }
}
