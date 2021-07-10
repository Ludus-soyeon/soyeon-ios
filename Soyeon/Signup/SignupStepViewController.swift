//
//  SignupStepViewController.swift
//  Soyeon
//
//  Created by 박은비 on 2021/04/22.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit
 
class SignupStepViewController<T: Codable>: UIViewController, LoadSignupViewData {
    typealias ViewDataType = T
    var step: Signup?
    
    var className: String {
        String(describing: type(of: self))
    }
     
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
     
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setStep()
    }
    
    private func setStep() {
        let name = className
         
        if let signup = Signup.initTo(classNamed: name) {
            self.step = signup
            saveSignupLocation(signup.resource)
        }
    }
    
    private func saveSignupLocation(_ path: String) {
        SYDefault.saveSignUpLocation = path
    }
    
}
