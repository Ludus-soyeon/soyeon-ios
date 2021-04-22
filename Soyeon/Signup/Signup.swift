//
//  Signup.swift
//  Soyeon
//
//  Created by 박은비 on 2021/03/29.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

enum Signup {
    case step1(Step1)
    
    var loaded: UINavigationController {
        switch self {
        case .step1(let step):
            return step.navigationTo(until: step)
        }
    }
    
    var rawValue: String {
        switch self {
        case .step1:
            return "step1"
        }
    }
    
    var path: String {
        switch self {
        case .step1(let step):
            return "step1.\(step.viewControllerName)"
        }
    }
    
    static func stringToInit(value: String) -> Signup? {
        let path = value.split(separator: ".").map { String($0) }
        guard path.count == 2 else { return nil }
        
        let signupPhase  = path[0]
        let location     = path[1]
          
        switch signupPhase {
        case Signup.step1(.none).rawValue:
            if let step1: Step1 = Step1.stringInit(value: location) {
                return Signup.step1(step1)
            }
        default:
            break
        }
        
        return nil
    }
    
    static func findStringToSignup(className: String) -> Signup? {
        if let step1 = Step1.stringInit(value: className) {
            return Signup.step1(step1)
        }
        
        return nil
    }
}
