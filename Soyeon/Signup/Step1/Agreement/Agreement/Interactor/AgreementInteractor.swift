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
    func loadViewData(_ data: Agreement.Agreements)
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
    func loadViewData(_ data: Agreement.Agreements) {
        output.loadViewData(data)
    }
    
    // MARK: - Business logic
    func updateAgreements(_ item: Agreement.Request) {
        var item = item
        worker.nagativeValue(&item.state)
        item.agreements.setButtonState(item.buttonType,
                                       state: item.state)
        
        output.present(response: Agreement.Response(agreements: item.agreements))
        
    }
    
}
