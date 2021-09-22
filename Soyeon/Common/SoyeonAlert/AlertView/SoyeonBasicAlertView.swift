//
//  SoyeonBasicAlertView.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/03.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

final class SoyeonBasicAlertView: UIView, AnimationAlertible, XibLoadable {
     
    typealias XibViewType = SoyeonBasicAlertView
    
    @IBOutlet private weak var messageLabel: UILabel!
    @IBOutlet private weak var buttonStackView: UIStackView!
    @IBOutlet private weak var closeButton: UIButton!
    
    typealias BackgroundViewType = TapDismissibleAlertView
    
    @IBOutlet internal weak var contentView: UIView!
    @IBOutlet internal weak var backgroundView: TapDismissibleAlertView!
    
    enum MyButtonStyle {
        case showClose
    }
    
    static func alert(closeStyle: MyButtonStyle? = nil, message: String) -> XibViewType? {
        
        guard let alertView = load() else {
            return nil
        }
        
        alertView.setupButton(to: closeStyle)
        
        alertView.setupLayout()
        
        alertView.backgroundView.delegate = alertView
        alertView.messageLabel.text = message
        
        return alertView
    }
    
    private func setupLayout() {
        contentView.setRadius(4)
    }
    
    private func setupButton(to style: MyButtonStyle? = nil) {
        switch style {
        case .showClose:
            closeButton.isHidden = false
        default:
            closeButton.isHidden = true
        }
    }
    
    @IBAction private func closeButtonDidTap(_ sender: Any) {
        dismissAnimation(with: .alpha)
    }
    
}

extension SoyeonBasicAlertView: TapDismissibleAnimationAlertDelegate {
    var style: AlertAnimationStyle? { .alpha }
}

extension SoyeonBasicAlertView: AlertActionAddinible {
    
    typealias ButtonType = SoyeonBasicAlertButton
    typealias ActionStyle = BasicAlertAction
    
    typealias Param = Void
    
    func insert(button: SoyeonBasicAlertButton) {
        buttonStackView.addArrangedSubview(button)
    }
    
}
