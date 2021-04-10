//
//  SignupViewLoadable.swift
//  Soyeon
//
//  Created by 박은비 on 2021/03/29.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

protocol SignupStepProtocol: CaseIterable, Equatable {
    var viewControllerName: String { get }
}

protocol SignupViewLoadable {
    associatedtype EnumType: SignupStepProtocol
    var storyboardName: String { get }
    func navigationTo(until: EnumType) -> UINavigationController
}

extension SignupViewLoadable {
    private var loadedStoryboard: UIStoryboard {
        let storyboard = UIStoryboard(name: storyboardName,
                                      bundle: Bundle.main)
        
        return storyboard
    }
    
    private func loadedViewConroller(names: [String]) -> UINavigationController {
        var viewControllers: [UIViewController] = []
        
        names.forEach { (name) in
            if !name.isEmpty {
                let loadedViewController = loadedStoryboard.instantiateViewController(identifier: name)
                viewControllers.append(loadedViewController)
            }
        }
        
        let navigationViewController = UINavigationController()
        navigationViewController.viewControllers = viewControllers
        
        return navigationViewController
    }
    
    func navigationTo(until: EnumType) -> UINavigationController {
        
        let allCases = EnumType.allCases
         
        if let firstIndex = allCases.firstIndex(of: until) {
            let untilViewCntorllerNames = allCases[...firstIndex].map { $0.viewControllerName }
            return loadedViewConroller(names: untilViewCntorllerNames)
        }
        
        return UINavigationController()
    }
}
