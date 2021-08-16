//
//  XibView.swift
//  Soyeon
//
//  Created by 박은비 on 2021/01/17.
//  Copyright © 2021 ludus. All rights reserved.
//
 
import UIKit

class XibView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }
    
    final private func loadView() {
        let name = classname
        if let loadedNib = Bundle.main.loadNibNamed(name, owner: self, options: nil)?.first as? UIView {
            addSubview(loadedNib)
            setFrame(loadedNib)
        }
    }
    
    internal func setFrame(_ view: UIView) {
        
        let constraints = [
            leftAnchor.constraint(equalTo: view.leftAnchor),
            rightAnchor.constraint(equalTo: view.rightAnchor),
            topAnchor.constraint(equalTo: view.topAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
    }
    
}
