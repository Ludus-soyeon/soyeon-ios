//
//  CheckMyCharacterRouter.swift
//  Soyeon
//
//  Created by 박은비 on 2021/05/26.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

protocol CheckMyCharacterRouterProtocol {

    var viewController: CheckMyCharacterViewController? { get }

    func navigateToSomewhere()
}

final class CheckMyCharacterRouter {

    weak var viewController: CheckMyCharacterViewController?

    // MARK: - Initializers

    init(viewController: CheckMyCharacterViewController?) {

        self.viewController = viewController
    }
}

// MARK: - CheckMyCharacterRouterProtocol

extension CheckMyCharacterRouter: CheckMyCharacterRouterProtocol {

    // MARK: - Navigation

    func navigateToSomewhere() {

    }
}
