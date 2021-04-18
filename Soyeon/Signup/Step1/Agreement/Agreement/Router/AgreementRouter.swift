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
    func navigateToNewAccount()
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
        
        if let type = AgreementDetail.AgreementDetailType(rawValue: type.rawValue) {
            let agreementDetailViewController = AgreementDetailViewController(type: type)
            viewController?.navigationController?.pushViewController(agreementDetailViewController,
                                                                     animated: true)
        }
    }
    
    func navigateToNewAccount() {
        let storyboard = UIStoryboard(name: "Step1", bundle: .main)
        if let destinationVC = storyboard
            .instantiateViewController(withIdentifier: "NewAccountViewController") as? NewAccountViewController {
            viewController?.navigationController?.pushViewController(destinationVC,
                                                                     animated: true)
        }
    }
} 
