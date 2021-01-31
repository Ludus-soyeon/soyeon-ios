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
        return UIFont(name: self.rawValue, size: size)!
    }
}
 
public extension Fonts {
    static func install(from bundles: [Bundle] ) {
        for each in Fonts.allCases {
            for bundle in bundles {
                if let cfURL = bundle.url(forResource: each.rawValue, withExtension: "ttf") {
                    CTFontManagerRegisterFontsForURL(cfURL as CFURL, .process, nil)
                } else {
                    assertionFailure("Could not find font:\(each.rawValue) in bundle:\(bundle)")
                }
            }
        }
    }
}
