//
//  WriteProfileDefualtButton.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/22.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit
 
final class WriteProfileDefualtButton: SoyeonAlertButton {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    required init(action closure: @escaping (String?) -> Void) {
        super.init(action: closure)
    }
     
    @available(iOS 14.0, *)
    required init(action: UIAction) {
        super.init(action: action)
    }
    
    init(_ title: String, action closure: @escaping (String?) -> Void) {
        super.init(action: closure)
        setTitle(title, for: .normal)
        setupLayout()
    }
    
    @available(iOS 14.0, *)
    init(_ title: String, action: UIAction) {
        super.init(action: action)
        setTitle(title, for: .normal)
        setupLayout()
    }
    
    private func setupLayout() {
        
        setBackgroundColor(.white, for: .normal)
        setTitleColor(#colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1), for: .normal)
        
        contentHorizontalAlignment = .left
        heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    }
}
