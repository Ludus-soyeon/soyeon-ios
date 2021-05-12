//
//  WriteProfile1Configurator.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/18.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

final class WriteProfile1Configurator {

    // MARK: - Singleton

    static let shared: WriteProfile1Configurator = WriteProfile1Configurator()

    // MARK: - Configuration

    func configure(viewController: WriteProfile1ViewController) {

        let router = WriteProfile1Router(viewController: viewController)
        let presenter = WriteProfile1Presenter(output: viewController)
        let interactor = WriteProfile1Interactor(output: presenter)

        viewController.output = interactor
        viewController.router = router
    }
}
