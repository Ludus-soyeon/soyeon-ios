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
 
    func attach(to superview: UIView) {
        superview.addSubview(self)
        sizeToFit(with: superview)
    }

}

// Constraint
extension UIView {
    
    /// Fill my constraints to view
    /// - Parameter view: will increase the size by parameter 'view'
    func sizeToFit(with view: UIView) {
        
        let constraints = [
            leftAnchor.constraint(equalTo: view.leftAnchor),
            rightAnchor.constraint(equalTo: view.rightAnchor),
            topAnchor.constraint(equalTo: view.topAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
    }
     
    func center(at view: UIView) {
        
        let constraints = [
            view.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: self.centerYAnchor)
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
