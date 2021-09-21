//
//  UIStackView+.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/09/21.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

public extension UIStackView {
    func removeAllArrangedSubviews() {
        arrangedSubviews.forEach {
            removeArrangedSubview($0)
            NSLayoutConstraint.deactivate($0.constraints)
            $0.removeFromSuperview()
        }
    }
}
