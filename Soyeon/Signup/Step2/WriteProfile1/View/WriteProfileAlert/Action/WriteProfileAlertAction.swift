//
//  WriteProfileAlertAction.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/22.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit.UIView

final class WriteProfileAlertAction: UIView {
    func makeItems(_ val: [String],
                   action: @escaping (String?) -> Void) -> [WriteProfileDefualtButton] {
        return val.map { (val) -> WriteProfileDefualtButton in
            return WriteProfileDefualtButton(title: val, action: action)
        }
    }
     
    func makeCustomView(with: WritingAlertStyle.AlertCustomButtonStyle,
                        action: @escaping (String?) -> Void) -> WriteProfileAlertCustomButton {
        return with.view(action: action) ?? WriteProfileAlertCustomButton()
    }
    
}
