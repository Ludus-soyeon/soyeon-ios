//
//  IntroViewController.swift
//  Soyeon
//
//  Created by 박은비 on 2021/03/24.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit
import SwiftyGif

final class IntroViewController: UIViewController {
    @IBOutlet private weak var introImageView: UIImageView!
    
    private enum Theme {
        static let logoImage = "soyeon-intro.gif"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageView()
    }
    
    private func setupImageView() {
        do {
            let gif = try UIImage(gifName: Theme.logoImage)
            let imageview = UIImageView(gifImage: gif, loopCount: 1)
            imageview.delegate = self
            imageview.frame = view.bounds
            view.addSubview(imageview)
        } catch {
            print(error)
        } 
    }
    
    private func makeNavigationController(rootViewController root: UIViewController) -> UINavigationController {
        let navigation = UINavigationController(rootViewController: root)
        navigation.isNavigationBarHidden = true
        return navigation
    }
    
    private func goStartSplash() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(identifier: "StartSplashViewController") as
            StartSplashViewController
        
        let navigation = makeNavigationController(rootViewController: viewController)
        UIApplication.shared.soyeonWindow?.rootViewController = navigation
    }
}

extension IntroViewController: SwiftyGifDelegate {
    func gifDidStop(sender: UIImageView) {
        goStartSplash()
    }
}
