//
//  ImageSliderView.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/09/12.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

final class ImageSliderView: XibView {
    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var pageLabel: UILabel!
    @IBOutlet private weak var editPhotoButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        setupLayout()
    }
    
    private func setupLayout() {
        editPhotoButton.layer.borderColor = UIColor.white.cgColor
    }
    
    func configure(images: [UIImage]) {
        stackView.removeAllArrangedSubviews()
        let imageViews = images.map { UIImageView(image: $0) }
        imageViews.forEach {
            $0.contentMode = .scaleAspectFit
            stackView.addArrangedSubview($0)
            $0.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
            $0.heightAnchor.constraint(equalTo: widthAnchor).isActive = true
        }
    }
}

extension ImageSliderView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.width) + 1
        pageLabel.text = "\(page) / \(stackView.arrangedSubviews.count)"
    }
}
