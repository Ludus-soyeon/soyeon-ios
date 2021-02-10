//
//  AgreementDetailRouter.swift
//  Soyeon
//
//  Created by 박은비 on 2021/01/02.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

protocol AgreementDetailRouterProtocol {

    var viewController: AgreementDetailViewController? { get }

    func navigateToPop()
}

final class AgreementDetailRouter {

    weak var viewController: AgreementDetailViewController?
    
    // MARK: - Initializers
    init(viewController: AgreementDetailViewController?) {

        self.viewController = viewController
    }
}
  
// MARK: - AgreementDetailRouterProtocol

extension AgreementDetailRouter: AgreementDetailRouterProtocol {
 
    // MARK: - Navigation
    func navigateToPop() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
