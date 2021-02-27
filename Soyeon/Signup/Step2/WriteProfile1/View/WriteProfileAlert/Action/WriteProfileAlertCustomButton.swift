//
//  WriteProfileAlertCustomButton.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/22.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

protocol WriteProfileAlertCustomButtonMakable: class {
    func setDelegate()
    func setupLayout()
}
 
class WriteProfileAlertCustomButton: UIView, WriteProfileAlertCustomButtonMakable {
    
    private var actionClosure: ((String?) -> Void)?
    internal var inputText: String = ""
    
    func setActionClosure(action: ((String?) -> Void)?) {
        actionClosure = action
    }
     
    @IBAction private func completeButtonDidTap(_ sender: Any) {
        actionClosure?(inputText)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setDelegate() {}
    func setupLayout() {}
}
 
