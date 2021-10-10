//
//  UIColor+.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/10/10.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(r: Int, g: Int, b: Int, a: Float = 1.0) {
        self.init(red: CGFloat(r) / 255.0,
                  green: CGFloat(g) / 255.0,
                  blue: CGFloat(b) / 255.0,
                  alpha: CGFloat(a))
    }
}
