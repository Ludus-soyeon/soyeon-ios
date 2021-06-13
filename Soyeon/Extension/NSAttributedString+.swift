//
//  NSAttributedString+.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/09/07.
//  Copyright © 2021 ludus. All rights reserved.
//

import Foundation

extension NSAttributedString {
    static func make(content: String, bold: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(
            string: content,
            attributes: [
                .font: Fonts.nanumSquareR.size(20.0),
                .foregroundColor: Colors.strongBlack.color()
            ]
        )
        let range = (content as NSString).range(of: bold)
        attributedString.setAttributes(
            [
                .font: Fonts.nanumSquareB.size(20.0)
            ],
            range: range
        )
        
        return attributedString
    }
}
