//
//  XibView.swift
//  Soyeon
//
//  Created by 박은비 on 2021/01/17.
//  Copyright © 2021 ludus. All rights reserved.
//
 
import UIKit
 
protocol XibLoadable: UIView {
    typealias XibViewType = Self
    func load() -> XibViewType?
}

extension XibLoadable {
    
    func load() -> XibViewType? {
        let name = classname
        if let loadedNib = Bundle.main.loadNibNamed(name, owner: self, options: nil)?.first as? XibViewType {
            
            return loadedNib
            
        }
        
        return nil
    }
    
    func attachView() {
        guard let loadedNib = load() else {
            return
        }
        
        addSubview(loadedNib)
        loadedNib.fillConstraint(to: self)
    }
    
}

class XibView: UIView, XibLoadable {
    
    typealias XibViewType = UIView
     
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        loadView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        translatesAutoresizingMaskIntoConstraints = false
        
        loadView()
    }
    
    private func loadView() {
        guard let nibView = load() else { return }
        
        addSubview(nibView)
        nibView.fillConstraint(to: self)
    }
    
    func load() -> UIView? {
        let name = classname
        if let loadedNib = Bundle.main.loadNibNamed(name, owner: self, options: nil)?.first as? UIView {
            
            return loadedNib
            
        }
        return nil
    }
}
