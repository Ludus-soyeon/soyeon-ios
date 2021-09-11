//
//  MyProfileDetailViewController.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/09/10.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

final class MyProfileDetailViewController: UIViewController {
    
    @IBOutlet private weak var containerStackView: UIStackView!
    @IBOutlet private weak var profileStackView: UIStackView!
    @IBOutlet private weak var pageScrollView: UIScrollView!
    @IBOutlet private weak var pageLabel: UILabel!
    @IBOutlet private weak var editPhotoButton: UIButton!
    @IBOutlet private weak var editBasicProfileButton: UIButton!
    @IBOutlet private weak var showProfileDetailButton: UIButton!
    @IBOutlet private weak var editLifestyleButton: UIButton!
    @IBOutlet private weak var scoreBadgeLabel: UILabel!
    @IBOutlet private weak var editIdealTypeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.isNavigationBarHidden = false
    }
    
    private func setupLayout() {
        navigationController?.isNavigationBarHidden = true
        
        let imageViews = [
            UIImageView(image: UIImage(systemName: "person.fill")),
            UIImageView(image: UIImage(systemName: "person.fill")),
            UIImageView(image: UIImage(systemName: "person.fill"))
        ]
        imageViews.forEach {
            $0.backgroundColor = UIColor.lightGray
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
            $0.heightAnchor.constraint(equalToConstant: view.frame.width).isActive = true
            $0.contentMode = .scaleAspectFit
            profileStackView.addArrangedSubview($0)
        }
        pageLabel.clipsToBounds = true
        pageLabel.layer.cornerRadius = 10
        editPhotoButton.layer.cornerRadius = 4
        editPhotoButton.layer.borderWidth = 1
        editPhotoButton.layer.borderColor = UIColor.white.cgColor
        editBasicProfileButton.layer.cornerRadius = 4
        editBasicProfileButton.layer.borderWidth = 1
        editBasicProfileButton.layer.borderColor = UIColor(
            red: 153/255,
            green: 153/255,
            blue: 153/255,
            alpha: 1.0
        ).cgColor
        showProfileDetailButton.layer.cornerRadius = 18
        showProfileDetailButton.layer.borderWidth = 0.5
        showProfileDetailButton.layer.borderColor = UIColor(
            red: 236/255,
            green: 236/255,
            blue: 236/255,
            alpha: 1.0
        ).cgColor
        editLifestyleButton.layer.cornerRadius = 4
        editLifestyleButton.layer.borderColor = UIColor(
            red: 153/255,
            green: 153/255,
            blue: 153/255,
            alpha: 1.0
        ).cgColor
        editLifestyleButton.layer.borderWidth = 1
        scoreBadgeLabel.layer.cornerRadius = 2
        scoreBadgeLabel.layer.borderWidth = 1
        scoreBadgeLabel.layer.borderColor = Colors.soyeonBlue.cgColor()
        editIdealTypeButton.layer.cornerRadius = 4
        editIdealTypeButton.layer.borderColor = UIColor(
            red: 153/255,
            green: 153/255,
            blue: 153/255,
            alpha: 1.0
        ).cgColor
        editIdealTypeButton.layer.borderWidth = 1
    }
}

extension MyProfileDetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.width) + 1
        pageLabel.text = "\(page) / 3"
    }
}
