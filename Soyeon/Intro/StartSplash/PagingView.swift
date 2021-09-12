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
      
    private var items: [UIView]?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    convenience init(views: [UIView]) {
        self.init(frame: .zero)
        
        items = views
        
        reload()
    }
    
    private func reloadItems() {
        guard let items = items else { return }
        setStackView(items)
        setPageConrol(items.count)
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
        changePageConrolIndex(to: 0)
    }
    
    private func changePageConrolIndex(to index: Int) {
        pageControl.currentPage = index
    }
    
    func reload() {
        reloadItems()
    }
    
} 

extension PagingView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pagingPosition = scrollView.contentOffset.x / self.frame.width
        let currentPaging = Int(round(pagingPosition))
        
        changePageConrolIndex(to: currentPaging)
        
    }
}
