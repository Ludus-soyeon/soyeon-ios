//
//  RatingView.swift
//  Soyeon
//
//  Created by 박은비 on 2021/08/16.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit
 
//: Sample
final class RatingView: UIView {
    private var stackView: RatingStackView!
    
    convenience init(named: String,
                     highlightColor: UIColor,
                     count: Int) {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
         
        let imageViews: [UIImageView] = (0..<count).map { _ in
            let image = UIImage(named: named)
            let highlight = image?.imageColor(to: highlightColor)
            
            let iv = UIImageView(image: image,
                                 highlightedImage: highlight)
            return iv
        }
        
        stackView = RatingStackView(arrangedImageSubviews: imageViews)
        stackView.spacing = 13.0
        stackView.delegate = self
        
        stackView.changeIndex(to: 0)
        
        setupStackViewConstraint()
        
        layoutIfNeeded()
    }
    
    private func setupStackViewConstraint() {
        addSubview(stackView)
        
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
        print(index)
    }
}
 
fileprivate extension UIImage {
  func imageColor(to color: UIColor) -> UIImage? {
      let image = withRenderingMode(.alwaysTemplate)
      return image.withTintColor(color)
  }
}

/*
let ratingView = RatingView(named: "btn_star_rate.png",
                           highlightColor: Colors.soyeonBlue.color(),
                           count: 5)

self.view.addSubview(ratingView)

let constraints = [
   ratingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
   ratingView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
]

NSLayoutConstraint.activate(constraints)
*/
