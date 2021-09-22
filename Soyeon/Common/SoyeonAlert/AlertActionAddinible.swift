//
//  AlertActionAddinible.swift
//  Soyeon
//
//  Created by 박은비 on 2021/09/22.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit.UIAction

/// Alert의 Action 열거 원시값에 따라 스타일을 다르게 지정할 경우 채택합니다.
protocol ActionStyleInitiateProtocol {
    associatedtype DesigndActionType
    
    func setLayout(to action: DesigndActionType)
    init(_ style: DesigndActionType, willCompletion closure: @escaping (String?) -> Void)
    
    @available(iOS 14.0, *)
    init(_ style: DesigndActionType, action: UIAction)
}
 
protocol AlertActionAddinible {
    
    associatedtype ButtonType
    associatedtype ActionStyle
    
    associatedtype Param
    
    /// Alert에 action button을 추가합니다.
    /// - Parameters:
    ///   - style: 해당 style에 맞추어 button의 UI가 구성됩니다.
    ///   - completion: button의 touch event 시 수행될 closure 입니다.
    func action(style: ActionStyle, completion: ((Param) -> Void)? ) -> Self
    
    /// Alert에 button을 삽입할 방법을 구성합니다.
    /// - Parameter button: 삽입될 버튼 객체
    func insert(button: ButtonType)
}

extension AlertActionAddinible where ButtonType: ActionStyleInitiateProtocol,
                                     ActionStyle == ButtonType.DesigndActionType,
                                     Param == Void {
    
    func action(style: ActionStyle, completion: ((Param) -> Void)? = nil) -> Self {
        let button: ButtonType!
        
        if #available(iOS 14.0, *) {
            button = ButtonType(style, action: UIAction(handler: { _ in
                completion?(Void())
            }))
            
        } else {
            button = ButtonType(style) { _ in
                completion?(Void())
            }
        }
        
        insert(button: button)
        
        return self
    }
    
}

protocol AlertActionDefinable: RawRepresentable where RawValue == Self { }

extension AlertActionDefinable {
    var rawValue: Self { self }
}

extension ActionStyleInitiateProtocol where Self: SoyeonAlertButton, DesigndActionType: AlertActionDefinable {
    
    init(_ style: DesigndActionType, willCompletion closure: @escaping (String?) -> Void) {
        self.init(action: closure)
        setLayout(to: style)
    }
    
    @available(iOS 14.0, *)
    init(_ style: DesigndActionType, action: UIAction) {
        self.init(action: action)
        setLayout(to: style)
    }
    
}
