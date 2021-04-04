//
//  RangeSlider.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/04/05.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

final class RangeSliderTrackLayer: CALayer {
    weak var rangeSlider: RangeSlider?
    
    override func draw(in ctx: CGContext) {
        guard let slider = rangeSlider else {
            return
        }
        let path = UIBezierPath(roundedRect: bounds,
                                cornerRadius: cornerRadius)
        ctx.addPath(path.cgPath)
        ctx.setFillColor(slider.trackTintColor.cgColor)
        ctx.fillPath()
        ctx.setFillColor(slider.trackHightlightColor.cgColor)
        let lowerValuePosition = slider.positionForValue(slider.lowerValue)
        let upperValuePosition = slider.positionForValue(slider.upperValue)
        let rect = CGRect(x: lowerValuePosition,
                          y: .zero,
                          width: upperValuePosition - lowerValuePosition,
                          height: bounds.height)
        ctx.fill(rect)
    }
}

final class RangeSlider: UIControl {
    override var frame: CGRect {
        didSet {
            updateLayerFrames()
        }
    }
    private let thumbSize = CGSize(width: 30, height: 30)
    private let trackLayer = RangeSliderTrackLayer()
    private let minimumValue: CGFloat = 0.0
    private let maximumValue: CGFloat = 1.0
    private(set) var lowerValue: CGFloat = 0.2 {
        didSet {
            updateLayerFrames()
        }
    }
    private(set) var upperValue: CGFloat = 0.8 {
        didSet {
            updateLayerFrames()
        }
    }
    private(set) var trackTintColor = UIColor(white: 0.9,
                                              alpha: 1.0) {
        didSet {
            trackLayer.setNeedsDisplay()
        }
    }
    private(set) var trackHightlightColor = UIColor(red: 0.0,
                                                    green: 0.45,
                                                    blue: 0.94,
                                                    alpha: 1.0) {
        didSet {
            trackLayer.setNeedsDisplay()
        }
    }
    private lazy var lowerThumbButton: UIImageView = {
        let button = UIImageView()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: thumbSize.width).isActive = true
        button.heightAnchor.constraint(equalToConstant: thumbSize.height).isActive = true
        button.backgroundColor = .yellow
        button.layer.cornerRadius = 15
        return button
    }()
    private lazy var upperThumbButton: UIImageView = {
        let button = UIImageView()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: thumbSize.width).isActive = true
        button.heightAnchor.constraint(equalToConstant: thumbSize.height).isActive = true
        button.backgroundColor = .yellow
        button.layer.cornerRadius = 15
        return button
    }()
    private(set) var previousLocation = CGPoint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        trackLayer.rangeSlider = self
        trackLayer.contentsScale = UIScreen.main.scale
        layer.addSublayer(trackLayer)
        addSubview(lowerThumbButton)
        addSubview(upperThumbButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateLayerFrames() {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        trackLayer.frame = bounds.insetBy(dx: 0.0,
                                          dy: bounds.height / 3.0)
        trackLayer.setNeedsDisplay()
        lowerThumbButton.frame = CGRect(origin: thumbOriginForValue(lowerValue),
                                        size: thumbSize)
        upperThumbButton.frame = CGRect(origin: thumbOriginForValue(upperValue),
                                        size: thumbSize)
        CATransaction.commit()
    }
    
    func positionForValue(_ value: CGFloat) -> CGFloat {
        return bounds.width * value
    }
    
    private func thumbOriginForValue(_ value: CGFloat) -> CGPoint {
        let x = positionForValue(value) - thumbSize.width / 2.0
        return CGPoint(x: x, y: (bounds.height - thumbSize.height / 2.0))
    }
}

extension RangeSlider {
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        previousLocation = touch.location(in: self)
        
        if lowerThumbButton.frame.contains(previousLocation) {
            lowerThumbButton.isHighlighted = true
        } else if upperThumbButton.frame.contains(previousLocation) {
            upperThumbButton.isHighlighted = true
        }
        
        return lowerThumbButton.isHighlighted || upperThumbButton.isHighlighted
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let location = touch.location(in: self)
        let deltaLocation = location.x - previousLocation.x
        let deltaValue = (maximumValue - minimumValue) * deltaLocation / bounds.width
        
        previousLocation = location
        
        if lowerThumbButton.isHighlighted {
            lowerValue += deltaValue
            lowerValue += boundValue(lowerValue,
                                     toLowerValue: minimumValue,
                                     upperValue: upperValue)
        } else if upperThumbButton.isHighlighted {
            upperValue += deltaValue
            upperValue = boundValue(upperValue,
                                    toLowerValue: lowerValue,
                                    upperValue: maximumValue)
        }
        sendActions(for: .valueChanged)
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        lowerThumbButton.isHighlighted = false
        upperThumbButton.isHighlighted = false
    }
    
    private func boundValue(_ value: CGFloat, toLowerValue lowerValue: CGFloat, upperValue: CGFloat) -> CGFloat {
        return min(max(value, lowerValue), upperValue)
    }
}
