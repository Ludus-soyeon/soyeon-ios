//
//  SignupStepSavable.swift
//  Soyeon
//
//  Created by 박은비 on 2021/04/10.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit
 
protocol SignupStepSavable: class {
    var step: Signup? { get set }
}

extension SignupStepSavable {
    var step: Signup? {
        get { return nil }
        set {
            if let newValue = newValue {
                UserDefaults.setValue(newValue.path,
                                      forKey: .saveSignUpLocation)
            }
        }
    }
}
