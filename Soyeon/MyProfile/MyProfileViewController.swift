//
//  MyProfileViewController.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/09/07.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

final class MyProfileViewController: UIViewController {
    @IBOutlet private weak var viewDetailButton: UIButton!
    
    private enum ViewMetrics {
        static let detailButtonCornerRadius: CGFloat = 15.0
        static let detailButtonBorderWidth: CGFloat = 1.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
    }
    
    private func setupLayout() {
        setNavigationTitle("내 프로필", font: Fonts.nanumSquareR.size(20.0))
        viewDetailButton.setTitleColor(Colors.soyeonBlue.color(),
                                       for: .normal)
        viewDetailButton.layer.cornerRadius = ViewMetrics.detailButtonCornerRadius
        viewDetailButton.layer.borderWidth = ViewMetrics.detailButtonBorderWidth
        viewDetailButton.layer.borderColor = Colors.soyeonBlue.color().cgColor
    }
    
}
