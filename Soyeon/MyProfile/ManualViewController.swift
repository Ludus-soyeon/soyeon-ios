//
//  ManualViewController.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/09/18.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

final class ManualViewController: UIViewController {
    
    @IBOutlet private weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
    }
    
    private func setupLayout() {
        setNavigationTitle("소연 이용 방법")
        textView.textContainerInset = UIEdgeInsets(
            top: 20,
            left: 18,
            bottom: 20,
            right: 19
        )
    }

}
