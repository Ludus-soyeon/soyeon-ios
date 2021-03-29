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
        }
    }
}

extension Step1: SignupLoadable {
    var storyboardName: String { return "Step1" }
}
