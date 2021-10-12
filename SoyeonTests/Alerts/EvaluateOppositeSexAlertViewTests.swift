//
//  EvaluateOppositeSexAlertViewTests.swift
//  SoyeonTests
//
//  Created by 박은비 on 2021/10/12.
//  Copyright © 2021 ludus. All rights reserved.
//

import XCTest
@testable import Soyeon

class EvaluateOppositeSexAlertViewTests: XCTestCase {
    let waiter = XCTWaiter()
    let expectation = XCTestExpectation(description: "AlertTesting")
    
    let alertTestingView: UIView! = UIApplication.shared.soyeonWindowView

    func testOppositeSexBackCaseAlert() {
         
        let alert = EvaluateOppositeSexAlertView.alert(on: .back)!
            .action(completion: { print("score: \($0)") })
            
        alert.show(to: alertTestingView)
        
        waiter.wait(for: [expectation], timeout: 3.0)
        
        XCTAssertTrue( alertTestingView.contains(target: alert) )
    }
 
    func testOppositeSexEvaluateCaseAlert() {
         
        let alert = EvaluateOppositeSexAlertView.alert(on: .evaluate(name: "김소연"))!
            .action(completion: { print("score: \($0)") })
        
        alert.show(to: alertTestingView)
        
        waiter.wait(for: [expectation], timeout: 3.0)
        
        XCTAssertTrue( alertTestingView.contains(target: alert) )
    }
    
}

fileprivate extension UIView {
    func contains(target view: UIView) -> Bool {
        return subviews.contains(where: { $0 === view })
    }
    
}
