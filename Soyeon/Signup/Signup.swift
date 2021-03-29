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
}
