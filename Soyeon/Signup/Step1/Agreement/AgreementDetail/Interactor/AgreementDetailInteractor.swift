//
//  AgreementDetailInteractor.swift
//  Soyeon
//
//  Created by 박은비 on 2021/01/02.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

protocol AgreementDetailInteractorInput: AgreementDetailViewControllerOutput {

}

protocol AgreementDetailInteractorOutput {
    func presentAgreementDetail(response: AgreementDetail.Response)
}

final class AgreementDetailInteractor {

    let output: AgreementDetailInteractorOutput
    let worker: AgreementDetailWorker

    // MARK: - Initializers
    init(output: AgreementDetailInteractorOutput, worker: AgreementDetailWorker = AgreementDetailWorker()) {

        self.output = output
        self.worker = worker
    }
}

// MARK: - AgreementDetailInteractorInput

extension AgreementDetailInteractor: AgreementDetailViewControllerOutput {
    func doAgreementDetailOnLoad(reqeust: AgreementDetail.Request) {
        
        let title = reqeust.detailType.detailTypeTitle()
        let content = worker.contentForDetailType(reqeust.detailType)
        
        output.presentAgreementDetail(response: AgreementDetail.Response(title: title, content: content))
    }
}
