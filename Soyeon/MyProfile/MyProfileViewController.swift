//
//  MyProfileViewController.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/09/07.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

enum Tab: Int {
    case myAttractiveness
    case match
    case home
    case myProfile
}

final class MyProfileViewController: UIViewController {
    @IBOutlet private weak var showDetailButton: UIButton!
    @IBOutlet private weak var myAttractivenessView: UIStackView!
    @IBOutlet private weak var excludingAcquaintancesView: UIStackView!
    @IBOutlet private weak var myAccountView: UIStackView!
    @IBOutlet private weak var manualView: UIStackView!
    @IBOutlet private weak var noticeView: UIStackView!
    @IBOutlet private weak var pushNotificationSettingsView: UIStackView!
    
    private enum ViewMetrics {
        static let detailButtonCornerRadius: CGFloat = 15.0
        static let detailButtonBorderWidth: CGFloat = 1.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
        configureView()
    }
    
    private func setupLayout() {
        UINavigationBar.appearance(whenContainedInInstancesOf: [CustomBackButtonNavController.self])
            .titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor(red: 57/255,
                                                                green: 57/255,
                                                                blue: 57/255,
                                                                alpha: 1.0),
                NSAttributedString.Key.font: Fonts.nanumSquareR.size(20)
            ]
        UIApplication.shared.windows.reload()
        setNavigationTitle("내 프로필")
        showDetailButton.setTitleColor(Colors.soyeonBlue.color(),
                                       for: .normal)
        showDetailButton.layer.cornerRadius = ViewMetrics.detailButtonCornerRadius
        showDetailButton.layer.borderWidth = ViewMetrics.detailButtonBorderWidth
        showDetailButton.layer.borderColor = Colors.soyeonBlue.color().cgColor
    }
    
    private func configureView() {
        myAttractivenessView.addTapGesture(target: self,
                                           action: #selector(myAttractivenessViewTapped))
        excludingAcquaintancesView.addTapGesture(target: self,
                                                 action: #selector(excludingAcquaintancesViewTapped))
        myAccountView.addTapGesture(target: self,
                                    action: #selector(myAccountViewTapped))
        manualView.addTapGesture(target: self,
                                 action: #selector(manualViewTapped))
        noticeView.addTapGesture(target: self,
                                 action: #selector(noticeViewTapped))
        pushNotificationSettingsView.addTapGesture(target: self,
                                                   action: #selector(pushNotificationSettingsViewTapped))
    }
    
    @objc private func myAttractivenessViewTapped() {
        tabBarController?.selectedIndex = Tab.myAttractiveness.rawValue
    }
    
    @objc private func excludingAcquaintancesViewTapped() {
        performSegue(withIdentifier: "ExcludingAcquaintancesViewController",
                     sender: nil)
    }
    
    @objc private func myAccountViewTapped() {
        performSegue(withIdentifier: "MyAccountViewController",
                     sender: nil)
    }
    
    @objc private func manualViewTapped() {
        performSegue(withIdentifier: "ManualViewController",
                     sender: nil)
    }
    
    @objc private func noticeViewTapped() {
        performSegue(withIdentifier: "NoticeViewController",
                     sender: nil)
    }
    
    @objc private func pushNotificationSettingsViewTapped() {
        performSegue(withIdentifier: "PushNotificationSettingsViewController",
                     sender: nil)
    }
}
