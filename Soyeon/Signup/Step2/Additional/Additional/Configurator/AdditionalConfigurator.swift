//
//  AdditionalConfigurator.swift
//  Soyeon
//
//  Created by 이재은 on 2021/03/08.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

final class AdditionalConfigurator {

    // MARK: - Singleton

    static let shared: AdditionalConfigurator = AdditionalConfigurator()

    // MARK: - Configuration

    func configure(viewController: AdditionalViewController) {

        let router = AdditionalRouter(viewController: viewController)
        let presenter = AdditionalPresenter(output: viewController)
        let interactor = AdditionalInteractor(output: presenter)

        viewController.output = interactor
        viewController.router = router
    }
}
