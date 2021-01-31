//
//  Fonts.swift
//  Soyeon
//
//  Created by 박은비 on 2020/12/26.
//  Copyright © 2020 ludus. All rights reserved.
//
 
import UIKit.UIFont

public enum Fonts: String, CaseIterable {
    case nanumSquareB = "NanumSquareB"
    case nanumSquareEB = "NanumSquareEB"
    case nanumSquareR = "NanumSquareR"
}

public extension Fonts {
    func size(_ size: CGFloat) -> UIFont {
        return UIFont(name: self.rawValue, size: size) ?? .systemFont(ofSize: size)
    }
}
