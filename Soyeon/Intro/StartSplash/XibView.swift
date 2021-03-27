//
//  XibView.swift
//  Soyeon
//
//  Created by 박은비 on 2021/01/17.
//  Copyright © 2021 ludus. All rights reserved.
//

import Foundation
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
    
     private func loadView() {
        let name = String(describing: type(of: self))
        if let loadedNib = Bundle.main.loadNibNamed(name, owner: self, options: nil)?.first as? UIView {
            self.addSubview(loadedNib)
            setFrame(loadedNib)
        }
    }
    
    private func setFrame(_ view: UIView) {
        self.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        self.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        self.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
}
