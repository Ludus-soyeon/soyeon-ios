//
//  LoadSignupView.swift
//  Soyeon
//
//  Created by 박은비 on 2021/03/29.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

protocol SignupStepProtocol: CaseIterable, Equatable {
    var viewControllerName: String { get }
}

protocol LoadSignupView: SignupStepProtocol {
    associatedtype EnumType: SignupStepProtocol
    var storyboardName: String { get }
    func navigationTo(until: EnumType) -> CustomBackButtonNavController
}

extension LoadSignupView {
    var loadedViewController: UIViewController {
        return loadedStoryboard.instantiateViewController(identifier: viewControllerName)
    }
    
    private var loadedStoryboard: UIStoryboard {
        let storyboard = UIStoryboard(name: storyboardName,
                                      bundle: Bundle.main)
        
        return storyboard
    }
    
    private func loadedViewConrollers(names: [String]) -> CustomBackButtonNavController {
        var viewControllers: [UIViewController] = []
        
        names.forEach { (name) in
            if !name.isEmpty {
                let loadedViewController = loadedStoryboard.instantiateViewController(identifier: name)
                viewControllers.append(loadedViewController)
            }
        }
        
        guard let rootViewController = viewControllers.first else { return .init() }
        
        let navigationViewController = CustomBackButtonNavController(rootViewController: rootViewController)
        navigationViewController.viewControllers = viewControllers
        
        return navigationViewController
    }
    
    func navigationTo(until: EnumType) -> CustomBackButtonNavController {
        
        let allCases = EnumType.allCases
         
        if let firstIndex = allCases.firstIndex(of: until) {
            let untilViewControllerNames = allCases[...firstIndex].map { $0.viewControllerName }
            return loadedViewConrollers(names: untilViewControllerNames)
        }
        
        return CustomBackButtonNavController()
    }
}
