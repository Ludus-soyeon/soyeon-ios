//
//  AppDelegate.swift
//  Soyeon
//
//  Created by junyng on 2020/12/20.
//  Copyright © 2020 ludus. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let backButtonImage = UIImage(named: "icoBackGnbNormal")?.withRenderingMode(.alwaysOriginal)
        let barAppearance = UINavigationBar.appearance(whenContainedInInstancesOf: [CustomBackButtonNavController.self])
        barAppearance.titleTextAttributes = [
            .foregroundColor: UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0),
            .font: Fonts.nanumSquareB.size(18.0)
        ]
        barAppearance.setBackgroundImage(UIImage(), for: .default)
        barAppearance.shadowImage = UIImage()
        barAppearance.isTranslucent = true
        barAppearance.backIndicatorImage = backButtonImage
        barAppearance.backIndicatorTransitionMaskImage = backButtonImage
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

