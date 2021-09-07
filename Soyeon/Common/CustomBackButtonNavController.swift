//
//  CustomBackButtonNavController.swift
//  Soyeon
//
//  Created by junyng on 2021/01/24.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

class CustomBackButtonNavController: UINavigationController { }

extension UIViewController {
    func setNavigationTitle(_ title: String, font: UIFont? = nil) {
        guard let navigationBar = navigationController?.navigationBar,
              let titleColor = navigationBar.titleTextAttributes?[.foregroundColor] as? UIColor,
              let font = font ?? navigationBar.titleTextAttributes?[.font] as? UIFont else {
            return
        }
        let label = UILabel()
        label.text = title
        label.tintColor = titleColor
        label.font = font
        label.sizeToFit()
        self.navigationItem.title = ""
        self.navigationItem.titleView = label
    }
}
