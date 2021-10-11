//
//  SoyeonRoundAlertView.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/06.
//  Copyright © 2021 ludus. All rights reserved.
//
 
import UIKit

final class SoyeonRoundAlertView: UIView, AnimationAlertible, XibLoadable {
    
    typealias XibViewType = SoyeonRoundAlertView
    
    typealias ActionStyle = RoundAlertAction
    
    @IBOutlet private weak var alertView: UIView!
    @IBOutlet private weak var messageLabel: UILabel!
    @IBOutlet private weak var buttonStackView: UIStackView!
     
    typealias BackgroundViewType = TapDismissibleAlertView
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var backgroundView: BackgroundViewType!
    
    static func alert(message: String) -> XibViewType? {
        let view = SoyeonRoundAlertView(frame: .zero)
      
        guard let alert = view.load() else {
            return nil
        }
         
        alert.setupLayout()
        
        alert.messageLabel.text = message
        
        alert.backgroundView.delegate = alert
        
        return alert
    }
    
    private func setupLayout() {
        alertView.setRadius(4)
    }
}
 
extension SoyeonRoundAlertView: TapDismissibleAnimationAlertDelegate {
    var style: AlertAnimationStyle? { .alpha }
}

extension SoyeonRoundAlertView: AlertActionAddinible {
    
    typealias ButtonType = SoyeonRoundAlertButton
    
    typealias Param = Void
     
    func insert(button: SoyeonRoundAlertButton) {
        buttonStackView.addArrangedSubview(button)
    }
    
}
