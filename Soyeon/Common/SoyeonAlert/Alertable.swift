//
//  File.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/03.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit
  
protocol Alertible: UIView {
    
    associatedtype BackgroundViewType: UIView = UIView
    var backgroundView: BackgroundViewType! { get set }
    
    var contentView: UIView! { get set } // alert으로 보여질 영역
    
    func show(to superview: UIView)
    func dismiss()
}

extension Alertible {
     
    func dismiss() {
        removeFromSuperview()
    }
}

// MARK: - SoyeonAlertable: 기본
extension Alertible where Self: XibLoadable {
    
    func show(to superview: UIView) {
//        attachView(to: superview)
        self.attach(to: superview)
        isHidden = false
    }
}
     
