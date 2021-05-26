//
//  CheckMyCharacterInteractor.swift
//  Soyeon
//
//  Created by 박은비 on 2021/05/26.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

protocol CheckMyCharacterInteractorInput: CheckMyCharacterViewControllerOutput {

}

protocol CheckMyCharacterInteractorOutput {

    func presentSomething()
}

final class CheckMyCharacterInteractor {

    let output: CheckMyCharacterInteractorOutput
    let worker: CheckMyCharacterWorker

    // MARK: - Initializers

    init(output: CheckMyCharacterInteractorOutput, worker: CheckMyCharacterWorker = CheckMyCharacterWorker()) {

        self.output = output
        self.worker = worker
    }
}

// MARK: - CheckMyCharacterInteractorInput

extension CheckMyCharacterInteractor: CheckMyCharacterViewControllerOutput {

    // MARK: - Business logic

    func doSomething() {

        worker.doSomeWork()

        output.presentSomething()
    }
}
