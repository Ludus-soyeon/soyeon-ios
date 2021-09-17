//
//  DormantApplicationViewController.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/09/17.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

final class DormantApplicationViewController: UIViewController {
    
    @IBOutlet private weak var normalDormancyView: UIView!
    @IBOutlet private weak var coupleDormancyView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
        configureView()
    }
    
    private func setupLayout() {
        setNavigationTitle("내 계정 / 휴면신청하기")
    }
    
    private func configureView() {
        normalDormancyView.addTapGesture(tapsRequired: 1,
                                         target: self,
                                         action: #selector(normalDormancyViewTapped))
        coupleDormancyView.addTapGesture(tapsRequired: 1,
                                         target: self,
                                         action: #selector(coupleDormancyViewTapped))
    }
    
    @objc private func normalDormancyViewTapped() {
        SoyeonBasicAlertView
            .alert(message: "휴면신청 하시겠습니까?")?
            .action(style: .basic("취소"), completion: { _ in })
            .action(style: .cancel("계정 휴면"), completion: { _ in })
            .show(to: self.view!, completion: nil)
    }

    @objc private func coupleDormancyViewTapped() {
        SoyeonBasicAlertView
            .alert(message: "휴면신청이 완료되었습니다.\n그리울거에요 ㅠㅠ")?
            .action(style: .basic("커플 휴면 하기"), completion: { [weak self] _ in
                self?.performSegue(withIdentifier: "CoupleDormancyViewController",
                                   sender: nil)
            })
            .action(style: .cancel("취소"), completion: { _ in })
            .show(to: self.view!, completion: nil)
    }
}
