//
//  SoyeonAlertButton.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/06.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit.UIButton

class SoyeonAlertButton<Action>: UIButton {
    typealias ActionStyle = Action
    private var actionClosure: (() -> Void)?
    
    @objc private func targetAction() {
        actionClosure?()
    }
    
    convenience init(action: @escaping () -> Void) {
        self.init()
        actionClosure = action
        self.addTarget(self, action: #selector(targetAction), for: .touchDown)
    }
    
    @available(iOS 14.0, *)
    convenience init(action: UIAction?) {
        self.init(primaryAction: action)
    }
     
}
