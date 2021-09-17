//
//  MyAccountViewController.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/09/17.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

final class MyAccountViewController: UIViewController {
    
    @IBOutlet private weak var accountStatusView: AccountStatusView!
    @IBOutlet private weak var dormantApplicationView: UIStackView!
    @IBOutlet private weak var withdrawalView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
        configureView()
    }
    
    private func setupLayout() {
        setNavigationTitle("내 계정")
    }
    
    private func configureView() {
        accountStatusView.configure(
            with: AccountStatusViewModel(
                status: .dating(nickname: "userid", startDate: Date()),
                date: Date()
            )
        )
        dormantApplicationView.addTapGesture(tapsRequired: 1,
                                             target: self,
                                             action: #selector(dormantApplicationViewTapped))
        withdrawalView.addTapGesture(tapsRequired: 1,
                                     target: self,
                                     action: #selector(withdrawalViewTapped))
    }
    
    @objc private func dormantApplicationViewTapped() {
        performSegue(withIdentifier: "DormantApplicationViewController",
                     sender: nil)
    }
    
    @objc private func withdrawalViewTapped() {
        SoyeonBasicAlertView
            .alert(message: "매력넘치는 0명의 이성이 당신을 기다리고 있습니다.\n정말 탈퇴하시겠습니까?")?
            .action(style: .basic("취소"), completion: { _ in })
            .action(style: .cancel("탈퇴하기"), completion: { [weak self] _ in
                guard let self = self else { return }
                let toast = SoyeonToast.toast(text: "탈퇴 완료!")
                toast?.show(to: self.view)
            })
            .show(to: self.view!, completion: nil)
    }
}
