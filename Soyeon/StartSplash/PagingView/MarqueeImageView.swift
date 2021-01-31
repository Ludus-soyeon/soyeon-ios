//
//  FlowView.swift
//  Soyeon
//
//  Created by 박은비 on 2021/01/17.
//  Copyright © 2021 ludus. All rights reserved.
//

import Foundation
import UIKit

final class MarqueeScrollView: UIScrollView {
    static var timer: Timer?
    private var currentView: UIImageView?
    private var rotationViews: [UIImageView] = []
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isScrollEnabled = false
        setAnimation()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialScrollView()
        setAnimation()
    }
      
    private func getRotationViewWidth() -> CGFloat {
        return rotationViews.first?.frame.width ?? 0
    }
    
    private func initialScrollView() {
        self.isScrollEnabled = false
        
        if let contentView = subviews.first as? UIImageView {
            rotationViews.append(contentView)
            currentView = contentView
            
            if let imageRef = contentView.image?.cgImage?.copy() {
                let copyImageView = UIImageView(image: UIImage(cgImage: imageRef))
                copyImageView.frame = CGRect(origin: CGPoint(x: getRotationViewWidth(), y: 0),
                                             size: rotationViews.first?.frame.size ?? CGSize.zero)
                rotationViews.append(copyImageView)
                self.addSubview(copyImageView)
            }
            
        }
    }
    
    func setAnimation() {
        MarqueeScrollView.timer = Timer.scheduledTimer(timeInterval: 0.01,
                             target: self,
                             selector: #selector(timerAction),
                             userInfo: nil,
                             repeats: true)
    }
    
    @objc private func timerAction() {
        self.contentOffset.x += 1
         
        if 0 < self.contentOffset.x &&
            (getRotationViewWidth() + self.frame.width) < self.contentOffset.x {
            self.contentOffset.x = self.frame.width
        }
    }
}
