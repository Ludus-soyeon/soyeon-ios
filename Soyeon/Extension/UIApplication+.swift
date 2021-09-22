//
//  UIApplication.swift
//  Soyeon
//
//  Created by 박은비 on 2021/04/27.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

extension UIApplication {
    var soyeonWindow: UIWindow! {
        UIApplication.shared.windows.filter {$0.isKeyWindow}.first
    }
    
    var soyeonWindowView: UIView! {
        soyeonWindow.rootViewController!.view
    }
}
