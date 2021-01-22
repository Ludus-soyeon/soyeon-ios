//
//  UILabel+.swift
//  Soyeon
//
//  Created by 이재은 on 2021/01/10.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

extension UILabel {

    func setLineSpacing(_ lineSpacing: CGFloat) {
        let paragraphStyle =  NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        var attributes = self.attributedText?.attributes(at: 0, effectiveRange: nil)
        attributes?[NSAttributedString.Key.paragraphStyle] = paragraphStyle
        self.attributedText = NSAttributedString(string: self.attributedText?.string ?? "", attributes: attributes)
    }
}
