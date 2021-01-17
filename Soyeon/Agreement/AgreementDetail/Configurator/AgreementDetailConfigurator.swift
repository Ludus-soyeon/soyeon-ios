//
//  AgreementDetailConfigurator.swift
//  Soyeon
//
//  Created by 박은비 on 2021/01/02.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

final class AgreementDetailConfigurator {
 
    // MARK: - Singleton
    static let shared: AgreementDetailConfigurator = AgreementDetailConfigurator()
 
    // MARK: - Configuration 
    func configure(viewController: AgreementDetailViewController) {

        let router = AgreementDetailRouter(viewController: viewController)
        let presenter = AgreementDetailPresenter(output: viewController)
        let interactor = AgreementDetailInteractor(output: presenter)

        viewController.output = interactor
        viewController.router = router
    }
}
