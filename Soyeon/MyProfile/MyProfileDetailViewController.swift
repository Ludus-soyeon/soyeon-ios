//
//  MyProfileDetailViewController.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/09/10.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

final class MyProfileDetailViewController: UIViewController {
    
    @IBOutlet private weak var backButton: UIButton!
    @IBOutlet private weak var imageSliderView: ImageSliderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        configureView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction private func backButtonTapped(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    private func setupLayout() {
        navigationController?.isNavigationBarHidden = true
    }
    
    private func configureView() {
        imageSliderView.configure(images: [
            UIImage(systemName: "person.fill")!,
            UIImage(systemName: "person.fill")!,
            UIImage(systemName: "person.fill")!
        ])
    }
}
