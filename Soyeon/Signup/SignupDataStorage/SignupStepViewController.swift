//
//  SignupStepViewController.swift
//  Soyeon
//
//  Created by 박은비 on 2021/04/22.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

class SignupStepViewController<T: SignupDataStorable>: UIViewController, LoadSignupViewData {
    typealias ViewDataType = T
    var step: Signup?
      
    lazy var viewData: ViewDataType = loadViewData() ?? .init() {
        willSet {
            setViewData(newValue)
        }
    }
    
    var className: String {
        String(describing: type(of: self))
    }
     
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setStep()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setStep()
    }
    
    private func setStep() {
        let name = className
         
        if let signup = Signup.initTo(classNamed: name) {
            step = signup
            saveSignupLocation(signup.resource)
        }
    }
    
    private func saveSignupLocation(_ path: String) {
        SYDefault.saveSignUpLocation = path
    }
    
}
