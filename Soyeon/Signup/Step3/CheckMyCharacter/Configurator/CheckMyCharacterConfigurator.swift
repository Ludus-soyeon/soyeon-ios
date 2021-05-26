//
//  CheckMyCharacterConfigurator.swift
//  Soyeon
//
//  Created by 박은비 on 2021/05/26.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

final class CheckMyCharacterConfigurator {

    // MARK: - Singleton

    static let shared: CheckMyCharacterConfigurator = CheckMyCharacterConfigurator()

    // MARK: - Configuration

    func configure(viewController: CheckMyCharacterViewController) {

        let router = CheckMyCharacterRouter(viewController: viewController)
        let presenter = CheckMyCharacterPresenter(output: viewController)
        let interactor = CheckMyCharacterInteractor(output: presenter)

        viewController.output = interactor
        viewController.router = router
    }
}
