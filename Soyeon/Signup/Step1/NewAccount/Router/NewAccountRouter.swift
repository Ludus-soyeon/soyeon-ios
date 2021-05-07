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
    
    func navigateToPhase(with nickName: String)
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
    func navigateToPhase(with nickName: String) { 
        let phaseVC = PhaseViewController(phase: .first(nickname: nickName))
        phaseVC.modalPresentationStyle = .fullScreen
        viewController?.navigationController?
            .present(phaseVC, animated: true, completion: nil)
    }
}
