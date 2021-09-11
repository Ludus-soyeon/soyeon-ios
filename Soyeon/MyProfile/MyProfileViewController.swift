//
//  MyProfileViewController.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/09/07.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

final class MyProfileViewController: UIViewController {
    @IBOutlet private weak var showDetailButton: UIButton!
    
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
        showDetailButton.setTitleColor(Colors.soyeonBlue.color(),
                                       for: .normal)
        showDetailButton.layer.cornerRadius = ViewMetrics.detailButtonCornerRadius
        showDetailButton.layer.borderWidth = ViewMetrics.detailButtonBorderWidth
        showDetailButton.layer.borderColor = Colors.soyeonBlue.color().cgColor
    }
    
}
