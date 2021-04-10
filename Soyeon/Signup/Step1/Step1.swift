//
//  Step1.swift
//  Soyeon
//
//  Created by 박은비 on 2021/03/29.
//  Copyright © 2021 ludus. All rights reserved.
//

import Foundation

enum Step1: SignupStepProtocol {
    typealias EnumType = Self
    case none
    case login
    case agreement
    case newAccount
    
    var viewControllerName: String {
        switch self {
        case .login:
            return "LoginViewController"
        case .agreement:
            return "AgreementViewController"
        case .newAccount:
            return "NewAccountViewController"
        case .none:
            return ""
        }
        
    }
    
    var rawValue: String {
        return viewControllerName
    }
    
    static func stringInit(value: String) -> Step1? {
        switch value {
        case Step1.login.rawValue:
            return Step1.login
        case Step1.agreement.rawValue:
            return Step1.agreement
        case Step1.newAccount.rawValue:
            return Step1.newAccount
        default:
            return nil
        }
    }
    
}

extension Step1: SignupViewLoadable {
    var storyboardName: String { return "Step1" }
}
