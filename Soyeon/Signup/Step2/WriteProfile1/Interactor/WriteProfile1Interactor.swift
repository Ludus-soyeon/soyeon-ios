//
//  WriteProfile1Interactor.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/18.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

protocol WriteProfile1InteractorInput: WriteProfile1ViewControllerOutput {

}

protocol WriteProfile1InteractorOutput {
    func presentWriteProfile(response: WriteProfile1Model.ViewModel)
}

final class WriteProfile1Interactor {

    let output: WriteProfile1InteractorOutput
    let worker: WriteProfile1Worker

    // MARK: - Initializers

    init(output: WriteProfile1InteractorOutput, worker: WriteProfile1Worker = WriteProfile1Worker()) {

        self.output = output
        self.worker = worker
    }
}

// MARK: - WriteProfile1InteractorInput

extension WriteProfile1Interactor: WriteProfile1ViewControllerOutput {

    // MARK: - Business logic
    func completedText(_ type: WriteProfileAlertViewModel.WriteProfileItem?,
                       _ input: String?,
                       request: WriteProfile1Model.ViewModel) {
        var request = request
        
        guard let type = type,
              var input = input else {
            output.presentWriteProfile(response: request)
            return
        }
        
        // TODO: - UserDefault 저장 필요.
        switch type {
        case .birthYear:
            input = String(worker.calculateAge(birthYear: input))
        default:
            break
        }
        
        request.inputAccordingToType(type, input: input)
         
        output.presentWriteProfile(response: request)
    }
}
