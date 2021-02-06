//
//  SoyeonBasicAlertView.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/03.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

final class SoyeonBasicAlertView: SoyeonAlert<SoyeonBasicAlertView>, SoyeonAlertActionable {
    typealias ActionStyle = SoyeonAlertStyle.ActionBasic
     
    @IBOutlet weak private var alertView: UIView!
    @IBOutlet weak private var messageLabel: UILabel!
    @IBOutlet weak private var buttonStackView: UIStackView!
    @IBOutlet weak private var closeButton: UIButton!

    override func layoutSubviews() {
        super.layoutSubviews()
        alertView.setRadius(4)
    }
     
    static func alert(style: SoyeonAlertStyle.Basic? = nil,
                      message: String) -> Custom? {
        guard let alert = super.alert() else {
            return nil
        }
        
        switch style {
        case .close:
            alert.closeButton.isHidden = false
        case .none:
            break
        }
        
        alert.messageLabel.text = message
        
        return alert
    }
    
    @discardableResult
    func action(style: ActionStyle,
                completion: @escaping (() -> Void)) -> Self {
        let button: SoyeonBasicAlertButton!
        if #available(iOS 14.0, *) {
            button = SoyeonBasicAlertButton(style, action: .init(handler: { _ in
                completion()
                super.dismiss()
            }))
        } else {
            button = SoyeonBasicAlertButton(style, action: {
                completion()
                super.dismiss()
            })
        }
        
        buttonStackView.addArrangedSubview(button)
          
        return self
    }
    
    @IBAction private func closeButtonDidTap(_ sender: Any) {
        dismiss()
    }
    
}
 
