//
//  RatingStackView.swift
//  Soyeon
//
//  Created by 박은비 on 2021/08/16.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

protocol RatingStackDelegate: AnyObject {
   func didChangeIndex(_ index: Int)
}

class RatingStackView: UIStackView {
   
   private var count: Int = 0
   private var imageSubViews: [UIImageView] = []
   private var subViewArea: CGFloat = 0.0
    
   private var initalPointX: CGFloat = 0.0 // Gesture Property
   
   private var index: Int = -1 {
       willSet {
           delegate?.didChangeIndex(newValue)
           setHighlight(until: newValue)
       }
   }
   
   weak var delegate: RatingStackDelegate?

   override init(frame: CGRect) {
       super.init(frame: .zero)
       
       translatesAutoresizingMaskIntoConstraints = false
       isUserInteractionEnabled = true
       axis = .horizontal
       
       configureTapGesture()
       configurePanGesture()
   }
   
   required init(coder: NSCoder) {
       super.init(coder: coder)
   }
   
   convenience init(arrangedImageSubviews imageViews: [UIImageView]) {
       self.init(frame: .zero)

       for view in imageViews {
           self.addArrangedSubview(view)
       }
       
       self.imageSubViews = imageViews
       self.count = imageViews.count
       
   }
   
   override func draw(_ rect: CGRect) {
       super.draw(rect)
       
       calcuratingArea()
   }
   
   override func insertArrangedSubview(_ view: UIView, at stackIndex: Int) { }
   override func removeArrangedSubview(_ view: UIView) { }
   
   override func addArrangedSubview(_ view: UIView) {
       if imageSubViews.count == 0 {
           super.addArrangedSubview(view)
       }
   }
   
   private func calcuratingArea() {
       guard let firstView = arrangedSubviews.first else { return }
       subViewArea = firstView.bounds.width + spacing
   }
     
   private func numberHorizontal(of pointX: CGFloat) -> Int {
       guard 0 < pointX else { return -1 }
       let number =  Int((pointX + spacing / 2.0) / subViewArea)
       
       guard number < arrangedSubviews.count else { return -1 }
       
       return number
   }
    
   func changeIndex(to index: Int) {
       guard self.index != index, 0 <= index else {
           return
       }
    
       self.index = min(index, count-1)
   }
   
   private func setHighlight(until i: Int) {
       imageSubViews[0...i].forEach { $0.isHighlighted = true }
       imageSubViews[i+1..<count].forEach { $0.isHighlighted = false }
   }
   
}

// MARK: - Gesture
private extension RatingStackView {
   private func configureTapGesture() {
       let tap = UITapGestureRecognizer(target: self, action: #selector(didTapGesture(_:)))
       addGestureRecognizer(tap)
   }
   
   private func configurePanGesture() {
       let pan = UIPanGestureRecognizer(target: self, action: #selector(didPanGesture(_:)))
       addGestureRecognizer(pan)
   }
    
   @objc
   private func didTapGesture(_ sender: UITapGestureRecognizer) {
       guard let view = sender.view as? UIStackView else {
           return
       }
       
       let pointX = sender.location(in: view).x
       
       let index = numberHorizontal(of: pointX)
       changeIndex(to: index)
        
   }
    
   @objc
   private func didPanGesture(_ sender: UIPanGestureRecognizer) {
       guard let view = sender.view as? UIStackView else {
           return
       }
         
       switch sender.state {
       case .began:
           initalPointX = sender.location(in: view).x
       case .changed:
           
           // panning 위치가 ImageView의 반 이상이 넘어갔을때 하이라이팅
           let translationX = sender.translation(in: view).x
           let positionX = initalPointX + translationX - (subViewArea / 2.0)
           
           let index = numberHorizontal(of: positionX)
           changeIndex(to: index)
           
       case .ended:
           initalPointX = 0.0
       default:
           break
       }
   }
}
 
