//
//  AgreementDetailPresenter.swift
//  Soyeon
//
//  Created by 박은비 on 2021/01/02.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

protocol AgreementDetailPresenterInput: AgreementDetailInteractorOutput {

}

protocol AgreementDetailPresenterOutput: AnyObject {

    func displayAgreementDetail(viewModel: AgreementDetail.AgreementDetailViewModel)
}

final class AgreementDetailPresenter {

    private(set) weak var output: AgreementDetailPresenterOutput!
 
    // MARK: - Initializers
    init(output: AgreementDetailPresenterOutput) {
        self.output = output
    }
}
 
// MARK: - AgreementDetailPresenterInput
extension AgreementDetailPresenter: AgreementDetailPresenterInput {
    // MARK: - Presentation logic
    func presentAgreementDetail(response: AgreementDetail.Response) {
        let viewModel = AgreementDetail.AgreementDetailViewModel(title: response.title,
                                                                 content: response.content)
        output.displayAgreementDetail(viewModel: viewModel)
    }
}
