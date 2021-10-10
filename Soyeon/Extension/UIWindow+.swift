//
//  UIWindow+.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/09/20.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

extension UIWindow {
    
    /// Unload all views and add back.
    /// Useful for applying `UIAppearance` changes to existing views.
    func reload() {
        subviews.forEach { view in
            view.removeFromSuperview()
            addSubview(view)
        }
    }
}

extension Array where Element == UIWindow {
    
    /// Unload all views for each `UIWindow` and add back.
    /// Useful for applying `UIAppearance` changes to existing views.
    func reload() {
        forEach { $0.reload() }
    }
}
