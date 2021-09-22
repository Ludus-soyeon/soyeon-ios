//
//  OppositesexProfileTests.swift
//  SoyeonTests
//
//  Created by 박은비 on 2021/09/23.
//  Copyright © 2021 ludus. All rights reserved.
//

import XCTest
@testable import Soyeon

class OppositesexProfileTests: XCTestCase {
    let waiter = XCTWaiter()
    let expectation = XCTestExpectation(description: "AlertTesting")
    
    let alertTestingView: UIView! = UIApplication.shared.soyeonWindowView

    func testShowUseHPInfoAlert() {
         
        let alert = SoyeonBasicAlertView.alert(message: "HP 10개가 소모됩니다.")!
        
        alert.action(style: .basic("하트 보내기")) {
            print("하트 보내기 액션")
        }
        .action(style: .cancel("취소"))
        .show(to: UIApplication.shared.soyeonWindowView)
        
        waiter.wait(for: [expectation], timeout: 3.0)
        
        XCTAssertTrue( alertTestingView.contains(target: alert) )
    }
    
}

fileprivate extension UIView {
    func contains(target view: UIView) -> Bool {
        return subviews.contains(where: { $0 === view })
    }
    
}
