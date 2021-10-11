//
//  CoupleDormancyViewController.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/09/18.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

final class CoupleDormancyViewController: UIViewController {
    
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var cardView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
    }
    
    private func setupLayout() {
        setNavigationTitle("커플휴면")
        textField.rightView = UIImageView(image: UIImage(named: "icoSearchMyprofileNormal"))
        textField.rightViewMode = .always
        cardView.setShadowWithColor(color: .black,
                                    opacity: 0.04,
                                    offset: CGSize(width: 3, height: 2),
                                    radius: 0,
                                    viewCornerRadius: 10)
    }
    
    @IBAction private func dormancyButtonTapped(_ sender: UIButton) {
        SoyeonBasicAlertView
            .alert(message: "커플이 되신 것을 축하드립니다!\n0님과 커플 휴면을 하시겠어요?")?
            .action(style: .basic("커플 휴면 하기"))
            .action(style: .cancel("취소"))
            .show(to: self.view)
    }
}
