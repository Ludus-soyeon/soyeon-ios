//
//  GuidanceConfigurator.swift
//  Soyeon
//
//  Created by 이재은 on 2020/12/25.
//  Copyright (c) 2020 ludus. All rights reserved.
//

import UIKit

final class GuidanceConfigurator {

    // MARK: - Singleton

    static let shared: GuidanceConfigurator = GuidanceConfigurator()

    // MARK: - Configuration

    func configure(viewController: GuidanceViewController) {

        let router = GuidanceRouter(viewController: viewController)
        let presenter = GuidancePresenter(output: viewController)
        let interactor = GuidanceInteractor(output: presenter)

        viewController.output = interactor
        viewController.router = router
    }
}
