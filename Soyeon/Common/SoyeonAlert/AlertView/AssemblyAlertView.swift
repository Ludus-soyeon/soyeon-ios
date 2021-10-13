//
//  AssemblyAlertView.swift
//  Soyeon
//
//  Created by 박은비 on 2021/10/12.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

class AssemblyAlertView: UIView, Alertible {
    
    typealias BackgroundViewType = UIView
    
    private let contentStackView: UIStackView! = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var headerView: UIView! = {
        let view = UIView()
        contentStackView.insertArrangedSubview(view, at: 0)
        return view
    }()
    
    private lazy var tailView: UIView! = {
        let view = UIView()
        contentStackView.insertArrangedSubview(view, at: contentStackView.subviews.count)
        return view
    }()
    
    private var bodyView: UIView!
     
    private enum ContentsType: Int {
        case header = 0
        case body
        case tail
    }
    
    internal lazy var contentView: UIView! = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentStackView)
        contentStackView.sizeToFit(with: view)
        
        self.addSubview(view)
        view.center(at: self)
        return view
    }()
    
    internal lazy var backgroundView: UIView! = {
        let view = UIView()
        view.backgroundColor = .clear
        view.attach(to: self)
        view.sizeToFit(with: self)
        
        self.bringSubviewToFront(view)
        
        return view
    }()
    
    lazy var size: CGSize = .zero {
        didSet {
            let fixWidth = contentView.widthAnchor.constraint(equalToConstant: size.width)
            let height = contentView.heightAnchor.constraint(equalToConstant: size.height)
            
            height.priority = .defaultLow
            
            NSLayoutConstraint.activate([fixWidth, height])
        }
    }
    
    init(header: UIView? = nil, body: UIView, tail: UIView? = nil) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        if let header = header {
            setupHeader(header)
        }
        
        bodyView = body
        bodyView.translatesAutoresizingMaskIntoConstraints = false
        
        let currentBodyIndex = min(contentStackView.subviews.count, ContentsType.body.rawValue)
        contentStackView.insertArrangedSubview(bodyView, at: currentBodyIndex)
        
        self.addSubview(contentView)
        
        if let tail = tail {
            setupTail(tail)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    static func alert(header: UIView? = nil, body: UIView, tail: UIView? = nil) -> AssemblyAlertView {
        
        let alert = AssemblyAlertView(header: header, body: body, tail: tail)
        return alert
        
    }
    
    func setupHeader(_ header: UIView) {
        headerView.addSubview(header)
        header.sizeToFit(with: headerView)
    }
    
    func setupTail(_ tail: UIView) {
        tailView.addSubview(tail)
        tail.sizeToFit(with: tailView)
    }
    
}
