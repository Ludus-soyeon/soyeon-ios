//
//  ExcludingAcquaintancesViewController.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/09/16.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

final class ExcludingAcquaintancesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
    
    private func setupLayout() {
        setNavigationTitle("아는 사람 만나지 않기",
                           font: Fonts.nanumSquareR.size(20.0))
    }
    
    @IBAction private func registerContactsButtonTapped(_ sender: UIButton) {
        let toast = SoyeonToast.toast(text: "연락처 등록 완료!")
        toast?.show(to: view)
    }
    
}
