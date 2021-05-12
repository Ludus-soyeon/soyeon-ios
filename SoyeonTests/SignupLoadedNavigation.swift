//
//  SignupLoadedNavigation.swift
//  SoyeonTests
//
//  Created by 박은비 on 2021/03/29.
//  Copyright © 2021 ludus. All rights reserved.
//

import XCTest
@testable import Soyeon

class SignupLoadedNavigation: XCTestCase {
    
    func testSignup1ToLogin() {
        let navigation = Signup.step1(.login).loadedStep

        let testResult = navigation.viewControllers[0] is LoginViewController
         
         XCTAssertTrue(testResult)
    }
    
    func testSignup1ToAgreement() {
       let navigation = Signup.step1(.agreement).loadedStep

       let testResult = navigation.viewControllers[0] is LoginViewController &&
                        navigation.viewControllers[1] is AgreementViewController
        
        XCTAssertTrue(testResult)
    }
    
    func testSignup1ToAccount() {
        let navigation = Signup.step1(.newAccount).loadedStep

        let testResult = navigation.viewControllers[0] is LoginViewController &&
            navigation.viewControllers[1] is AgreementViewController &&
            navigation.viewControllers[2] is NewAccountViewController
         
         XCTAssertTrue(testResult)
    }
    
    func testSignup2ToWriteProfile1() {
        let navigation = Signup.step2(.writeProfile1).loadedStep

        let testResult = navigation.viewControllers[0] is WriteProfile1ViewController
         
         XCTAssertTrue(testResult)
    }
    
}
