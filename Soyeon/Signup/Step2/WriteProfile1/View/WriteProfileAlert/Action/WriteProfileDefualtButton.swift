//
//  WriteProfileDefualtButton.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/22.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

final class WriteProfileDefualtButton: SoyeonAlertButton {
    convenience init(title: String, action: @escaping (String?) -> Void) {
        self.init(action: action)
        setupLayout(title: title)
    }
    
    @available(iOS 14.0, *)
    convenience init(title: String, action: UIAction?) {
        self.init(action: action)
        setupLayout(title: title)
    }
    
    private func setupLayout(title: String) {
        backgroundColor = .white
        setTitle(title, for: .normal)
        setTitleColor(#colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1), for: .normal)
        contentHorizontalAlignment = .left
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
}
