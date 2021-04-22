//
//  SignupStepViewController.swift
//  Soyeon
//
//  Created by 박은비 on 2021/04/22.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

class SignupStepViewController<T: Codable>: UIViewController, SignupStepSavable, LoadSignupViewData {
    typealias ViewDataType = T
    var step: Signup?
     
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setStep()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setStep()
    }
    
    private func setStep() {
        let name = String(describing: type(of: self))
        
        if let signup = Signup.findStringToSignup(className: name) {
            self.step = signup
        }
    }
}
