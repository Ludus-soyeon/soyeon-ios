//
//  SoyeonAlertButton.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/06.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit.UIButton

final class SoyeonBasicAlertButton: SoyeonAlertButton<SoyeonAlertStyle.ActionBasic> {
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
        switch style {
        case .basic(let title):
            setTitle(title, for: .normal)
            titleLabel?.font = Fonts.nanumSquareB.size(14)
            setTitleColor(UIColor.white, for: .normal)
            backgroundColor = Colors.soyeonBlue.color()
        case .cancel(let title):
            setTitle(title, for: .normal)
            titleLabel?.font = Fonts.nanumSquareR.size(14)
            setTitleColor(Colors.black.color(), for: .normal)
            backgroundColor = UIColor.white
        }
        
    }
}
