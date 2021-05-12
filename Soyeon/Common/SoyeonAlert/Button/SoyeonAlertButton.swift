//
//  SoyeonAlertButton.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/06.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit.UIButton

class SoyeonAlertButton: UIButton {
    private var actionClosure: ((String?) -> Void)?
     
    @objc private func targetAction() {
        actionClosure?(titleLabel?.text)
    }
    
    convenience init(action: @escaping (String?) -> Void) {
        self.init()
        actionClosure = action
        self.addTarget(self, action: #selector(targetAction), for: .touchDown)
    }
    
    @available(iOS 14.0, *)
    convenience init(action: UIAction?) {
        self.init(primaryAction: action)
    }
     
}
