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
    
    private let contentViewSize: SizeConstraint!
    
    internal lazy var contentView: UIView! = {
        let view = UIView(withConstraintSize: contentViewSize)
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
     
    init(header: UIView? = nil, body: UIView, tail: UIView? = nil, size: SizeConstraint) {
        self.contentViewSize = size
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
        self.contentViewSize = .zero
        super.init(coder: coder)
    }
    
    static func alert(header: UIView? = nil, body: UIView, tail: UIView? = nil,
                      size: SizeConstraint) -> AssemblyAlertView {
        
        let alert = AssemblyAlertView(header: header, body: body, tail: tail, size: size)
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

extension UIView {
    private var size: SizeConstraint {
        get { self.size }
        set {
            let width = widthAnchor.constraint(equalToConstant: newValue.width.constraint)
            let height = heightAnchor.constraint(equalToConstant: newValue.height.constraint)
            
            width.priority = newValue.width.priority
            height.priority = newValue.height.priority
            
            NSLayoutConstraint.activate([width, width])
        }
    }
    
    struct ViewConstraintSize {
        let constraint: CGFloat
        var priority: UILayoutPriority = .defaultLow
        
        init(_ constraint: CGFloat, priority: UILayoutPriority = .defaultLow) {
            self.constraint = constraint
            self.priority = priority
        }
    }
    
    struct SizeConstraint {
        let width: ViewConstraintSize
        let height: ViewConstraintSize
        
        static let zero: SizeConstraint = .init()
        
        init(width: ViewConstraintSize = .init(0), height: ViewConstraintSize = .init(0)) {
            self.width = width
            self.height = height
        }
    }
    
    /// Init view to 'size' add constraint.
    /// - Parameter size: Add width and height constraints as size values.
    convenience init(withConstraintSize size: SizeConstraint) {
        self.init(frame: .zero)
        self.size = size
    }
    
}
