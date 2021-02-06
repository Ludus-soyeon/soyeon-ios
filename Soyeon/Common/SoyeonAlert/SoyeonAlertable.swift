//
//  File.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/03.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit
  
struct SoyeonAlertStyle {
    enum Basic {
        case close
    }
    
    enum ActionBasic {
        case basic(String)
        case cancel(String)
    }
    
    enum ActionRound {
        case basic(String)
        case other(String)
    }
}

protocol SoyeonAlertable {
    associatedtype Custom
    static func alert() -> Custom?

    func show(to parentView: UIView,
              completion: (() -> Void)?)
    
    func dismiss()
} 

protocol SoyeonAlertActionable {
    associatedtype ActionStyle
    
    func action(style: ActionStyle,
                completion: @escaping (() -> Void)) -> Self
}
