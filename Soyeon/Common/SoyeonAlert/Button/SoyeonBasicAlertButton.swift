//
//  SoyeonAlertButton.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/06.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit.UIButton

enum BasicAlertAction: AlertActionDefinable {
    case basic(String)
    case cancel(String)
    
    init?(rawValue: BasicAlertAction) {
        switch rawValue {
        case .basic(let title):
            self = BasicAlertAction.basic(title)
            
        case .cancel(let title):
            self = BasicAlertAction.cancel(title)
             
        }
    }
}

final class SoyeonBasicAlertButton: SoyeonAlertButton, ActionStyleInitiateProtocol {
    
    typealias DesigndActionType = BasicAlertAction
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    required init(action closure: @escaping (String?) -> Void) {
        super.init(action: closure)
    }
    
    @available(iOS 14.0, *)
    required init(action: UIAction) {
        super.init(action: action)
    }
    
    internal func setLayout(to action: BasicAlertAction) {
        switch action {
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
