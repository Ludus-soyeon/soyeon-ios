//
//  RatingView.swift
//  Soyeon
//
//  Created by 박은비 on 2021/08/16.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit
  
protocol RatingViewDelegate: AnyObject {
    func didChangeIndex(_ index: Int)
}

final class RatingView: UIView {
    
    private var stackView: RatingStackView!
    
    weak var delegate: RatingViewDelegate?
    
    private var imageViewAttributes: RatingImageViewsAttributes = .init()
    
    private var stackViewAttributes: RatingStackViewAttributes = .init()
      
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupLayout()
        
        let imageViews = initImageViews(attributes: imageViewAttributes)
        
        setupStackView(with: imageViews, attributes: stackViewAttributes)
        
        addSubview(stackView)
        setupStackViewConstraint()
    }
    
    private func setupLayout() {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        tintColor = imageViewAttributes.highlightColor
    }
    
    private func initImageViews(attributes: RatingImageViewsAttributes) -> [UIImageView] {
        let imageName = attributes.imageName
        let highlightColor = attributes.highlightColor
        let count = attributes.count
        
        let imageViews: [UIImageView] = (0..<count).map { _ in
            let image = UIImage(named: imageName)
            let highlight = image?.imageColor(to: highlightColor)
            let iv = UIImageView(image: image,
                                 highlightedImage: highlight)
            return iv
        }
        
        return imageViews
    }
    
    private func setupStackView(with imageViews: [UIImageView], attributes: RatingStackViewAttributes) {
        stackView = RatingStackView(arrangedImageSubviews: imageViews)
        stackView.spacing = attributes.spacing
        
        stackView.delegate = self
        
        stackView.changeIndex(to: attributes.index)
    }
    
    private func setupStackViewConstraint() {
        
        let constraints = [
            stackView.leftAnchor.constraint(equalTo: leftAnchor),
            stackView.rightAnchor.constraint(equalTo: rightAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}

extension RatingView: RatingStackDelegate {
    func didChangeIndex(_ index: Int) {
        delegate?.didChangeIndex(index)
    }
}

// MARK: - Stack View
extension RatingView {
    /// user defined runtime attributes
    struct RatingStackViewAttributes {
        var index: Int
        var spacing: CGFloat
        
        init() {
            self.index = 0
            self.spacing = 13.0
        }
    }
    
    @objc var index: NSNumber {
        get { NSNumber(value: stackViewAttributes.index) }
        set { stackViewAttributes.index = newValue.intValue }
    }
    
    @objc var spacing: NSNumber {
        get { NSNumber(value: Float(stackViewAttributes.spacing)) }
        set { stackViewAttributes.spacing = CGFloat(newValue.floatValue) }
    }
}

// MARK: - Rating Image View
extension RatingView {
    /// user defined runtime attributes
    struct RatingImageViewsAttributes {
        var imageName: String
        var highlightColor: UIColor
        var count: Int
        
        init() {
            self.imageName = ""
            self.highlightColor = UIColor.blue
            self.count = 5
        }
    }
    
    @objc var imageName: NSString {
        get { NSString(string: imageViewAttributes.imageName) }
        set { imageViewAttributes.imageName = String(newValue) }
    }
     
    @objc var highlightColor: UIColor {
        get { imageViewAttributes.highlightColor }
        set { imageViewAttributes.highlightColor = newValue }
    }
    
    @objc var count: NSNumber {
        get { NSNumber(value: imageViewAttributes.count) }
        set { imageViewAttributes.count = newValue.intValue }
    }
    
}
 
fileprivate extension UIImage {
    func imageColor(to color: UIColor) -> UIImage? {
        let image = withRenderingMode(.alwaysTemplate)
        return image.withTintColor(color)
    }
}
