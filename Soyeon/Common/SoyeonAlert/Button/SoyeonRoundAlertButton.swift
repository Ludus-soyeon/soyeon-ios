//
//  SoyeonRoundAlertButton.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/06.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit.UIButton
 
enum RoundAlertAction: AlertActionDefinable {
  
  case other(String)
  case basic(String)
  
  init?(rawValue: RoundAlertAction) {
      switch rawValue {
      case .basic(let title):
          self = RoundAlertAction.basic(title)
          
      case .other(let title):
          self = RoundAlertAction.other(title)
           
      }
  }
}

final class SoyeonRoundAlertButton: SoyeonAlertButton {
    
    typealias DesigndActionType = RoundAlertAction
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    required init(action closure: @escaping (String?) -> Void) {
        super.init(action: closure)
        setupLayout()
    }
    
    @available(iOS 14.0, *)
    required init(action: UIAction) {
        super.init(action: action)
        setupLayout()
    }
    
    private func setupLayout() {
        setRadius(23)
        titleLabel?.font = Fonts.nanumSquareR.size(16)
        heightAnchor.constraint(equalToConstant: 46).isActive = true
        
    }
}
 
extension SoyeonRoundAlertButton: ActionStyleInitiateProtocol {
    
  internal func setLayout(to action: RoundAlertAction) {
      switch action {
      case .basic(let title):
          setTitle(title, for: .normal)
          setTitleColor(UIColor.white, for: .normal)
          backgroundColor = Colors.soyeonBlue.color()
          
      case .other(let title):
          setTitle(title, for: .normal)
          setTitleColor(Colors.soyeonBlue.color(), for: .normal)
          backgroundColor = UIColor.white
          setBorderWithColor(Colors.soyeonBlue.color(), width: 1.0)
      }
  }
}
