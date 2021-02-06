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
    
    @IBOutlet weak private var alertView: UIView!
    @IBOutlet weak private var messageLabel: UILabel!
    @IBOutlet weak private var buttonStackView: UIStackView!
      
    override func layoutSubviews() {
        super.layoutSubviews()
        alertView.setRadius(4)
    }
    
    static func alert(message: String) -> Custom? {
        guard let alert = super.alert() else {
            return nil
        }
        
        alert.messageLabel.text = message
          
        return alert
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
 
