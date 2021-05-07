//
//  NewAccountRouter.swift
//  Soyeon
//
//  Created by junyng on 2021/01/17.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

protocol NewAccountRouterProtocol {
    var viewController: NewAccountViewController? { get }
    
    func navigateToPhase()
}

final class NewAccountRouter {
    weak var viewController: NewAccountViewController?

    // MARK: - Initializers
    init(viewController: NewAccountViewController?) {
        self.viewController = viewController
    }
}

// MARK: - NewAccountRouterRouterProtocol
extension NewAccountRouter: NewAccountRouterProtocol {
    // MARK: - Navigation
    func navigateToPhase() {
         
        self.viewController?.dismiss(animated: true, completion: {
            let phaseVC = PhaseViewController(phase: .first)
            phaseVC.modalPresentationStyle = .fullScreen
            
            let rootNavigation = UIApplication.shared.soyeonWindow?.rootViewController as? UINavigationController
            
            rootNavigation?.present(phaseVC, animated: true, completion: nil)
        })
    }
}
