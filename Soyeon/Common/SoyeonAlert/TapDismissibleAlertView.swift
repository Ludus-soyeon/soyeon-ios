//
//  AlertBackgroundView.swift
//  Soyeon
//
//  Created by 박은비 on 2021/09/22.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

/// Tap gesture로 View를 제거합니다.
final class TapDismissibleAlertView: UIView {

    weak var delegate: TapDismissibleAlertDelegate?
    
    var alertStyle: AlertAnimationStyle?
    var isTapDismiss: Bool = true
    
    var dismissCompletion: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGesture()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGesture()
    }
    
    @objc
    private func dismiss() {
        guard isTapDismiss else { return }
        
        delegate?.dismissing(completon: dismissCompletion)
    }
    
    private func setupGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismiss))
        
        addGestureRecognizer(tap)
    }
}

protocol TapDismissibleAlertDelegate: AnyObject {
    func dismissing(completon: (() -> Void)?)
}

extension TapDismissibleAlertDelegate where Self: Alertible {
    func dismissing(completon: (() -> Void)?) {
        
        dismiss()
        completon?()
        
    }
}

protocol TapDismissibleAnimationAlertDelegate: TapDismissibleAlertDelegate where Self: AnimationAlertible {
    var style: AlertAnimationStyle? { get }
}

extension TapDismissibleAnimationAlertDelegate where Self: AnimationAlertible {
    var style: AlertAnimationStyle? { nil }
    
    func dismissing(completon: (() -> Void)?) {
        
        guard let style = style else {
            dismiss()
            completon?()
            return
        }
        
        dismissAnimation(with: style) {
            completon?()
        }
        
    }
}
