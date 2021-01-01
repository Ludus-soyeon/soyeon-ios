//
//  AgreementInteractor.swift
//  Soyeon
//
//  Created by 박은비 on 2020/12/23.
//  Copyright (c) 2020 ludus. All rights reserved.
//

import UIKit

protocol AgreementInteractorInput: AgreementViewControllerOutput {

}

protocol AgreementInteractorOutput {

    func present(response: Agreement.Response)
}

final class AgreementInteractor {

    let output: AgreementInteractorOutput
    let worker: AgreementWorker

    // MARK: - Initializers

    init(output: AgreementInteractorOutput, worker: AgreementWorker = AgreementWorker()) {

        self.output = output
        self.worker = worker
    }
}

// MARK: - AgreementInteractorInput
extension AgreementInteractor: AgreementViewControllerOutput { 
    
    // MARK: - Business logic
    func updateAgreements(_ item: Agreement.Request) {
        var item = item
        var target = item.agreement
        worker.nagativeValue(&target.1)
        item.agreements.setButtonState(target)
        
        output.present(response: Agreement.Response(agreements: item.agreements))
        
    }
    
}
