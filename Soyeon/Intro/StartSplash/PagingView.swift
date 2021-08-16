//
//  PagingView.swift
//  Soyeon
//
//  Created by 박은비 on 2021/01/10.
//  Copyright © 2021 ludus. All rights reserved.
//
 
import UIKit

final class PagingView: XibView {
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet private weak var pageControl: UIPageControl!
      
    private var items: [UIView] = [] {
        willSet {
            setStackView(newValue)
            setPageConrol(newValue.count)
        }
    }

    private func setStackView(_ views: [UIView] ) {
        stackView.subviews.forEach { $0.removeFromSuperview() }
        
        views.forEach { view in
            stackView.addArrangedSubview(view)
            view.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
            view.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
        }
    }
    
    private func setPageConrol(_ size: Int) {
        pageControl.numberOfPages = size
        setPageConrolIndex(0)
    }
    
    private func setPageConrolIndex(_ index: Int) {
        pageControl.currentPage = index
    }
     
    func setItems(_ items: [UIView]) {
        self.items = items
    }
    
} 

extension PagingView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pagingPosition = scrollView.contentOffset.x / self.frame.width
        let currentPaging = Int(round(pagingPosition))
        
        setPageConrolIndex(currentPaging)
        
    }
}
