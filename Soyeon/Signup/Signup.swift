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
    case phaseFirst
    case step2(Step2)
    case phaseSecond
    case step3(Step3)
    
    var loadedStep: CustomBackButtonNavController {
        switch self {
        case .step1(let step):
            return step.navigationTo(until: step)
        case .step2(let step):
            return step.navigationTo(until: step)
        case .step3(let step):
            return step.navigationTo(until: step)
        default:
            return .init()
        }
    }
    
    var loadedPhase: UIViewController {
        switch self {
        case .phaseFirst:
            return PhaseViewController(phase: .first)
        case .phaseSecond:
            return PhaseViewController(phase: .second)
        default:
            return .init()
        }
    }
    
    var path: String {
        switch self {
        case .step1:
            return "step1"
        case .phaseFirst:
            return "first"
        case .step2:
            return "step2"
        case .phaseSecond:
            return "second"
        case .step3:
            return "step3"
        }
    }
    
    var resource: String {
        switch self {
        case .step1(let step):
            return "step1.\(step.viewControllerName)"
        case .phaseFirst:
            return "first.PhaseViewController"
        case .step2(let step):
            return "step2.\(step.viewControllerName)"
        case .phaseSecond:
            return "second.PhaseViewController"
        case .step3(let step):
            return "step3.\(step.viewControllerName)"
        }
    }
    
    /// path를 Signup 객체로 반환합니다.
    static func initTo(path: String) -> Signup? {
        let path = path.split(separator: ".").map { String($0) }
        guard 0 < path.count else { return nil }
        
        let signupPhase  = path.first!
        let location     = path.last ?? signupPhase
          
        switch signupPhase {
        case Signup.step1(.none).path:
            if let step1: Step1 = Step1.initRawValue(location) {
                return Signup.step1(step1)
            }
        case Signup.phaseFirst.path:
            return Signup.phaseFirst
            
        case Signup.step2(.none).path:
            if let step2: Step2 = Step2.initRawValue(location) {
                return Signup.step2(step2)
            }
        case Signup.phaseSecond.path:
            return Signup.phaseSecond
            
        case Signup.step3(.none).path:
            if let step3: Step3 = Step3.initRawValue(location) {
                return Signup.step3(step3)
            }
            
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
        } else if let step2 = Step2.initRawValue(name) {
            return Signup.step2(step2)
        } else if let step3 = Step3.initRawValue(name) {
            return Signup.step3(step3)
        }
        
        return nil
    }
}
