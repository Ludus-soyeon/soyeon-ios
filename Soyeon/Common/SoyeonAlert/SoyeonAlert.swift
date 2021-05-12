//
//  SoyeonAlert.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/03.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

public class SoyeonAlert<Custom>: UIView, SoyeonAlertable {
    class func alert() -> Custom? {
        if let loadedNib = Bundle.main.loadNibNamed(String(describing: Custom.self),
                                                    owner: self,
                                                    options: nil)?.first as? Custom {
            return loadedNib
        }
        return nil
    }
     
    func show(to parentView: UIView,
              completion: (() -> Void)? = nil) {
        parentView.addSubview(self)
        
        NSLayoutConstraint.activate( [topAnchor.constraint(equalTo: parentView.topAnchor),
                                      leftAnchor.constraint(equalTo: parentView.leftAnchor),
                                      rightAnchor.constraint(equalTo: parentView.rightAnchor),
                                      bottomAnchor.constraint(equalTo: parentView.bottomAnchor)])
         
        parentView.bringSubviewToFront(self)
    }
    
    func dismiss() {
        removeFromSuperview() 
    }
}
