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

protocol WriteProfileAlertCompleteButtonDelegate: class {
    func completeButtonDidTap()
}

class WriteProfileAlertCustomButton: UIView, WriteProfileAlertCustomButtonMakable {
    weak var customButtonDelegate: WriteProfileAlertCompleteButtonDelegate?
    
    private var actionClosure: ((String?) -> Void)?
    internal var inputText: String = ""
    
    func setActionClosure(action: ((String?) -> Void)?) {
        actionClosure = action
    }
     
    @IBAction private func completeButtonDidTap(_ sender: Any) {
        customButtonDelegate?.completeButtonDidTap()
        
        if inputText.isEmpty { return }
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
 
