//
//  PushNotificationSetttingsViewController.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/09/18.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

final class PushNotificationSetttingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
    }

    private func setupLayout() {
        setNavigationTitle("푸시알림설정")
    }
}
