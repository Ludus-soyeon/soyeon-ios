//
//  SoyeonRoundAlertButton.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/06.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit.UIButton

final class SoyeonRoundAlertButton: SoyeonAlertButton<SoyeonAlertStyle.ActionRound> {
    convenience init(_ style: ActionStyle, action: @escaping () -> Void) {
        self.init(action: action)
        setLayout(style: style)
    }
    
    @available(iOS 14.0, *)
    convenience init(_ style: ActionStyle, action: UIAction?) {
        self.init(action: action)
        setLayout(style: style)
    }
    
    private func setLayout(style: ActionStyle) {
        setRadius(23)
        titleLabel?.font = Fonts.nanumSquareR.size(16)
        heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        switch style {
        case .basic(let title):
            setTitle(title, for: .normal)
            setTitleColor(UIColor.white, for: .normal)
            backgroundColor = Colors.soyeonBlue.color()
        case .other(let title):
            setTitle(title, for: .normal)
            setTitleColor(Colors.soyeonBlue.color(), for: .normal)
            backgroundColor = UIColor.white
            setBorderWithColor(Colors.soyeonBlue.color(),
                               width: 1.0)
        }
    }
}
