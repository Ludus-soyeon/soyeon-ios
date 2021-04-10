//
//  AgreementConfigurator.swift
//  Soyeon
//
//  Created by 박은비 on 2020/12/23.
//  Copyright (c) 2020 ludus. All rights reserved.
//

import UIKit

final class AgreementConfigurator: LoadedSignupStep {

    // MARK: - Singleton

    static let shared: AgreementConfigurator = AgreementConfigurator()

    // MARK: - Configuration

    func configure(viewController: AgreementViewController) {

        let router = AgreementRouter(viewController: viewController)
        let presenter = AgreementPresenter(output: viewController)
        let interactor = AgreementInteractor(output: presenter)

        viewController.output = interactor
        viewController.router = router
        
        self.step = .step1(.agreement)
    }
}
