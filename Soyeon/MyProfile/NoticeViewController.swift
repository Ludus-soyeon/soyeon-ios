//
//  NoticeViewController.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/09/18.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

final class NoticeViewController: UIViewController {

    @IBOutlet private weak var textView: UITextView!
    @IBOutlet private weak var inqueryButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
    }
    
    private func setupLayout() {
        setNavigationTitle("공지사항")
        textView.textContainerInset = UIEdgeInsets(
            top: 20,
            left: 18,
            bottom: 20,
            right: 19
        )
        inqueryButton.setBorderWithColor(UIColor(r: 0, g: 0, b: 0, a: 0.15),
                                         width: 1)
        inqueryButton.setRadius(4)
        inqueryButton.translatesAutoresizingMaskIntoConstraints = false
        inqueryButton.widthAnchor.constraint(equalToConstant: 68).isActive = true
        inqueryButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
    
    @IBAction func inqueryButtonTapped(_ sender: UIButton) {
        SoyeonBasicAlertView
            .alert(message: "도움이 필요하실 경우\nhelp@soyeon.com로 문의주시면\n순차적으로 답변 드리겠습니다.")?
            .action(style: .basic("확인"))
            .show(to: self.view)
    }
}
