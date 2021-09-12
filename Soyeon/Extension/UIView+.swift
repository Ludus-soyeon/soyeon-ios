//
//  UIView+.swift
//  Soyeon
//
//  Created by 이재은 on 2021/01/17.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

extension UIView: ReuseIdentifiable {
    /**
     Set a shadow on a UIView.
     - parameters:
        - color: Shadow color, defaults to black
        - opacity: Shadow opacity, defaults to 1.0
        - offset: Shadow offset, defaults to zero
        - radius: Shadow radius, defaults to 0
        - viewCornerRadius: If the UIView has a corner radius this must be set to match
    */
    func setShadowWithColor(color: UIColor?,
                            opacity: Float?,
                            offset: CGSize?,
                            radius: CGFloat,
                            viewCornerRadius: CGFloat) {
        layer.shadowColor = color?.cgColor ?? UIColor.black.cgColor
        layer.shadowOpacity = opacity ?? 1.0
        layer.shadowOffset = offset ?? CGSize.zero
        layer.shadowRadius = radius
        layer.cornerRadius = viewCornerRadius
    }
    
    /**
     Set a border on a UIView.
     - parameters:
        - color: Border color, defaults to clear
        - width: Border width, defaults to 0
    */
    func setBorderWithColor(_ color: UIColor?,
                            width: CGFloat = 0) {
        layer.borderColor =  color?.cgColor ?? UIColor.clear.cgColor
        layer.borderWidth = width
    }
 
    func setRadius(_ radius: CGFloat) {
        layer.cornerRadius = radius
    }
    
    /// Fill my constraints to superview
    /// - Parameter superview: fill target
    func fillConstraint(to superview: UIView) {
        let constraints = [
            leftAnchor.constraint(equalTo: superview.leftAnchor),
            rightAnchor.constraint(equalTo: superview.rightAnchor),
            topAnchor.constraint(equalTo: superview.topAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
    }
}

extension UIView {
    public func addTapGesture(tapsRequired: Int = 1, target: AnyObject, action: Selector) {
        let gesture = UITapGestureRecognizer(target: target, action: action)
        gesture.numberOfTapsRequired = tapsRequired
        addGestureRecognizer(gesture)
        isUserInteractionEnabled = true
    }
}
