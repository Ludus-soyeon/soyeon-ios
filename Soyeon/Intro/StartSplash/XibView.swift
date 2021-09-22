//
//  XibView.swift
//  Soyeon
//
//  Created by 박은비 on 2021/01/17.
//  Copyright © 2021 ludus. All rights reserved.
//
 
import UIKit
 
protocol XibLoadable: UIView {
    associatedtype XibViewType: UIView = Self.Type
    func load() -> XibViewType?
}

extension XibLoadable {
     
    static func load() -> XibViewType? {
        let name = classname
        if let loadedNib = Bundle.main.loadNibNamed(name, owner: self, options: nil)?.first as? XibViewType {

            return loadedNib
            
        }
        
        return nil
    }
    
    func load() -> XibViewType? {
        return Self.load()
    }
    
    func loadView() {
        guard let nibView = load() else { return }
        nibView.attach(to: self)
    }
}
  
// Subclassing at File's Owner
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
    
    func load() -> XibViewType? {
        let name = classname
        if let loadedNib = Bundle.main.loadNibNamed(name, owner: self, options: nil)?.first as? XibViewType {
            return loadedNib
        }
        
        return nil
    }
    
    func loadView() {
       guard let nibView = load() else { return }
       nibView.attach(to: self)
   }
    
}
