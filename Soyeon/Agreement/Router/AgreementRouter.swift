//
//  AgreementRouter.swift
//  Soyeon
//
//  Created by 박은비 on 2020/12/23.
//  Copyright (c) 2020 ludus. All rights reserved.
//

import UIKit

protocol AgreementRouterProtocol {

    var viewController: AgreementViewController? { get }

    func navigateToAgreementDetail(type: Agreement.AgreementButtonTag)
    func navigateToJoin()
}

final class AgreementRouter {

    weak var viewController: AgreementViewController?

    // MARK: - Initializers

    init(viewController: AgreementViewController?) {

        self.viewController = viewController
    }
}

// MARK: - AgreementRouterProtocol

extension AgreementRouter: AgreementRouterProtocol {

    // MARK: - Navigation
    
    func navigateToAgreementDetail(type: Agreement.AgreementButtonTag) {
        print("navigateToAgreementDetail \(type)")
    }
    
    func navigateToJoin() {
        print("navigationToJoin")
    }
}
