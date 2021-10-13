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
     
    static func load(xibName: String = classname) -> XibViewType? {
        let name = xibName
        if let loadedNib = Bundle.main.loadNibNamed(name, owner: self, options: nil)?.first as? XibViewType {

            return loadedNib
            
        }
        
        return nil
    }
    
   /// 서브클래싱 된 다수의 View로 구성되어 있을 경우.
    static func load(xibName: String, identifier: String) -> XibViewType? {
        
        guard let loaded = Bundle.main.loadNibNamed(xibName, owner: self, options: nil) as? [UIView] else {
            return nil
        }
        
        for view in loaded where view.accessibilityIdentifier == identifier {
            return view as? XibViewType
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
