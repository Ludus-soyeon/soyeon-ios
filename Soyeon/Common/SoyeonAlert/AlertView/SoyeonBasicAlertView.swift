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
     
    @IBOutlet private weak var alertView: UIView!
    @IBOutlet private weak var messageLabel: UILabel!
    @IBOutlet private weak var buttonStackView: UIStackView!
    @IBOutlet private weak var closeButton: UIButton!
 
    static func alert(style: SoyeonAlertStyle.Basic? = nil,
                      message: String) -> Custom? {
        guard let alert = super.alert() else {
            return nil
        }
        
        alert.setLayout()
        
        switch style {
        case .close:
            alert.closeButton.isHidden = false
        case .none:
            break
        }
        
        alert.messageLabel.text = message
        
        return alert
    }
    
    private func setLayout() {
        alertView.setRadius(4)
    }
    
    @discardableResult
    func action(style: ActionStyle,
                completion: @escaping ((String?) -> Void)) -> Self {
        let button: SoyeonBasicAlertButton!
        if #available(iOS 14.0, *) {
            button = SoyeonBasicAlertButton(style, action: .init(handler: { _ in
                completion(nil)
                super.dismiss()
            }))
        } else {
            button = SoyeonBasicAlertButton(style, action: { _ in
                completion(nil)
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
 
