//
//  AgreementPresenter.swift
//  Soyeon
//
//  Created by 박은비 on 2020/12/23.
//  Copyright (c) 2020 ludus. All rights reserved.
//

import UIKit

protocol AgreementPresenterInput: AgreementInteractorOutput {

}

protocol AgreementPresenterOutput: class {

    func display(viewModel: Agreement.AgreementViewModel)
}

final class AgreementPresenter {

    private(set) weak var output: AgreementPresenterOutput!

    // MARK: - Initializers

    init(output: AgreementPresenterOutput) {

        self.output = output
    }
}

// MARK: - AgreementPresenterInput

extension AgreementPresenter: AgreementPresenterInput {

    // MARK: - Presentation logic

    func present(response: Agreement.Response) {
        let agreements = response.agreements
        let viewModel = Agreement.AgreementViewModel(agreements: Agreement.Agreements(privacy: agreements.privacy,
                                                                                      service: agreements.service,
                                                                                      marketing: agreements.marketing))
        
        output.display(viewModel: viewModel)
    }
     
    
    func loadViewData(_ data: Agreement.Agreements) {
        output.display(viewModel: .init(agreements: data))
    }
}
