//
//  SoyeonToast.swift
//  Soyeon
//
//  Created by 박은비 on 2021/03/18.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit.UILabel

final class SoyeonToast: UIView {
    
    @IBOutlet private var textLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    static func toast(text: String) -> SoyeonToast? {
        if let loadedNib = Bundle.main.loadNibNamed(SoyeonToast.reuseIdentifier,
                                 owner: self,
                                 options: nil)?.first as? SoyeonToast {
            
            loadedNib.textLabel?.text = text
            
            return loadedNib
        }
        return nil
    }
      
    func show(to: UIView) {
        to.addSubview(self)
           
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: to.centerXAnchor),
            centerYAnchor.constraint(equalTo: to.centerYAnchor),
            widthAnchor.constraint(lessThanOrEqualTo: to.widthAnchor, multiplier: 0.9)
        ])
        
        animation()
    }
      
    private func setupView() {
        alpha = 0
        setRadius(16)
    }
    
    private func animation() {
        UIView.animate(withDuration: 0.2) {
            self.alpha = 1
        } completion: { (_) in
            UIView.animate(withDuration: 0.3, delay: 2, options: .curveEaseInOut) {
                self.alpha = 0
            } completion: { (_) in
                self.removeFromSuperview()
            }
        }
    }
}
