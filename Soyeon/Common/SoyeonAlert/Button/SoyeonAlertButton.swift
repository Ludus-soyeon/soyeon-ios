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
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    required init(action closure: @escaping (String?) -> Void) {
        super.init(frame: .zero)
        self.actionClosure = closure
        self.addTarget(self, action: #selector(targetAction), for: .touchDown)
        
    }
    
    @available(iOS 14.0, *)
    required init(action: UIAction) {
        super.init(frame: .zero)
        self.addAction(action, for: .touchDown)
    }
    
}
