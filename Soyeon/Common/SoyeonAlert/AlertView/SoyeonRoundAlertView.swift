//
//  SoyeonRoundAlertView.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/06.
//  Copyright © 2021 ludus. All rights reserved.
//
 
import UIKit

final class SoyeonRoundAlertView: SoyeonAlert<SoyeonRoundAlertView>, SoyeonAlertActionable {
    typealias ActionStyle = SoyeonAlertStyle.ActionRound
    
    @IBOutlet private weak var alertView: UIView!
    @IBOutlet private weak var messageLabel: UILabel!
    @IBOutlet private weak var buttonStackView: UIStackView!
  
    static func alert(message: String) -> Custom? {
        guard let alert = super.alert() else {
            return nil
        }
        alert.setLayout()
        
        alert.messageLabel.text = message
          
        return alert
    }
     
    private func setLayout() {
        alertView.setRadius(4)
    }
    
    @discardableResult
    func action(style: ActionStyle,
                completion: @escaping (() -> Void)) -> Self {
        let button: SoyeonRoundAlertButton!
        if #available(iOS 14.0, *) {
            button = SoyeonRoundAlertButton(style, action: .init(handler: { _ in
                completion()
                super.dismiss()
            }))
        } else {
            button = SoyeonRoundAlertButton(style, action: {
                completion()
                super.dismiss()
            })
        }
        
        buttonStackView.addArrangedSubview(button)
          
        return self
    }
      
}
 
