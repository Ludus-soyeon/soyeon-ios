//
//  NewAccountConfigurator.swift
//  Soyeon
//
//  Created by junyng on 2021/01/17.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

final class NewAccountConfigurator: LoadedSignupStep {
    // MARK: - Singleton
    static let shared: NewAccountConfigurator = NewAccountConfigurator()

    // MARK: - Configuration
    func configure(viewController: NewAccountViewController) {
        let router = NewAccountRouter(viewController: viewController)
        let presenter = NewAccountPresenter(output: viewController)
        let interactor = NewAccountInteractor(output: presenter)
        viewController.output = interactor
        viewController.router = router
        
        self.step = .step1(.newAccount)
    }
}
