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
    }
}
