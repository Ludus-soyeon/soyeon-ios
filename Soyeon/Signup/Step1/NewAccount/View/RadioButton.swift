//
//  RadioButton.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/01/31.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

final class RadioButton: UIButton {
    private let ringColor = UIColor(r: 153, g: 153, b: 153)
    private let ringSize = CGSize(width: 22.0, height: 22.0)
    private let ringSpacing: CGFloat = 3.6
    private let ringWidth: CGFloat = 1.0
    
    private let selectedFillColor = Colors.soyeonBlue.color()
    
    private let titleColor = UIColor(r: 153, g: 153, b: 153)
    private let titleFont = Fonts.nanumSquareR.size(15.0)
    private var titleSize: CGSize {
        guard let label = self.titleLabel,
              let string = label.text else { return .zero }
        return string.size(withAttributes: [NSAttributedString.Key.font: label.font as UIFont])
    }
    private var titleLeftMargin: CGFloat {
        return ringSize.width + titleSpacing
    }
    private let titleSpacing: CGFloat = 6.0
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: titleLeftMargin + titleSpacing,
                      height: max(ringSize.height, titleSize.height))
    }
    
    override var isSelected: Bool {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        let ringCircleRect = CGRect(origin: rect.origin, size: ringSize).extended(by: -ringWidth)
        let ringCircle = UIBezierPath(ovalIn: ringCircleRect)
        context.addPath(ringCircle.cgPath)
        context.setFillColor(ringColor.cgColor)
        context.setStrokeColor(titleColor.cgColor)
        context.drawPath(using: .stroke)
        
        if isSelected {
            let selectedCircleRect = ringCircleRect.extended(by: -ringSpacing)
            let selectedCircle = UIBezierPath(ovalIn: selectedCircleRect)
            context.addPath(selectedCircle.cgPath)
            context.setFillColor(selectedFillColor.cgColor)
            context.drawPath(using: .fill)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    private func setupLayout() {
        titleLabel?.font = titleFont
        setTitleColor(titleColor, for: .normal)
        setTitleColor(titleColor, for: .selected)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: titleLeftMargin, bottom: 0, right: 0)
    }
}

private extension CGRect {
    func extended(by size: CGFloat) -> CGRect {
        return CGRect(x: self.minX - size, y: self.minY - size,
                      width: self.width + size * 2, height: self.height + size * 2)
    }
}
