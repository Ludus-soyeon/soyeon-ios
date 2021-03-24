//
//  IntroViewController.swift
//  Soyeon
//
//  Created by 박은비 on 2021/03/24.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

final class IntroViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.navigationController?
                .pushViewController(StartSplashViewController(), animated: false)
        }
    }
}
