//
//  WriteProfile1Router.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/18.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

protocol WriteProfile1RouterProtocol {

    var viewController: WriteProfile1ViewController? { get }

    func navigationToWriteIntroduction()
}

final class WriteProfile1Router {

    weak var viewController: WriteProfile1ViewController?

    // MARK: - Initializers

    init(viewController: WriteProfile1ViewController?) {

        self.viewController = viewController
    }
}

// MARK: - WriteProfile1RouterProtocol

extension WriteProfile1Router: WriteProfile1RouterProtocol {

    // MARK: - Navigation
    
    func navigationToWriteIntroduction() {
        
        let vc = Step2.writeIntroduction.loadedViewController
        
        self.viewController?.navigationController?
            .pushViewController(vc,
                                animated: true)
    }
}
