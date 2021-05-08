//
//  Signup.swift
//  Soyeon
//
//  Created by 박은비 on 2021/03/29.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit
  
protocol SignupStepProtocol: CaseIterable, Equatable {
   var viewControllerName: String { get }
}

enum Signup {
    case step1(Step1)
    case phaseFirst
    case step2(Step2)
    
    var loadedStep: CustomBackButtonNavController {
        switch self {
        case .step1(let step):
            return step.navigationTo(until: step)
        case .step2(let step):
            return step.navigationTo(until: step)
        default:
            return .init()
        }
    }
    
    var loadedPhase: UIViewController {
        switch self {
        case .phaseFirst:
            return PhaseViewController(phase: .first)
        default:
            return .init()
        }
    }
    
    var rawValue: String {
        switch self {
        case .step1:
            return "step1"
        case .phaseFirst:
            return "PhaseViewController"
        case .step2:
            return "step2"
        }
    }
    
    var path: String {
        switch self {
        case .step1(let step):
            return "step1.\(step.viewControllerName)"
        case .phaseFirst:
            return "PhaseViewController"
        case .step2(let step):
            return "step2.\(step.viewControllerName)"
        }
    }
    
    /// path를 Signup 객체로 반환합니다.
    static func initTo(path: String) -> Signup? {
        let path = path.split(separator: ".").map { String($0) }
        guard 0 < path.count else { return nil }
        
        let signupPhase  = path.first!
        let location     = path.last ?? signupPhase
          
        switch signupPhase {
        case Signup.step1(.none).rawValue:
            if let step1: Step1 = Step1.initRawValue(location) {
                return Signup.step1(step1)
            }
        case Signup.phaseFirst.rawValue:
            return Signup.phaseFirst
            
        default:
            break
        }
        
        return nil
    }
    
    /// className을 Signup 객체로 반환합니다.
    static func initTo(classNamed name: String) -> Signup? {
        if let phase = Signup.initTo(path: name) {
            return phase
        } else if let step1 = Step1.initRawValue(name) {
            return Signup.step1(step1)
        }
        
        return nil
    }
}
