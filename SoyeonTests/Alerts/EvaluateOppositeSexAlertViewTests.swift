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
    
    func testLowEvaluateOppositeSexAlertView() {
        let alert = LowEvaluateOppositeSexAlertView()
        
        alert.backgroundColor = UIColor(r: 10, g: 10, b: 10, a: 0.8)
        alert.size = CGSize(width: 300, height: 210)
        
        alert.show(to: alertTestingView)
        waiter.wait(for: [expectation], timeout: 3.0)
        XCTAssertTrue( alertTestingView.contains(target: alert) )
    }
     
    func testAssemblyAlertView() {
        
        var colors: [UIColor] = [.red, .orange, .yellow, .green, .blue, .purple]
        
        let header: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = colors.removeFirst()
            view.heightAnchor.constraint(equalToConstant: 100).isActive = true
            return view
        }()
        
        let tail: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = colors.removeLast()
            view.heightAnchor.constraint(equalToConstant: 50).isActive = true
            return view
        }()
        
        let colorfulViews: [UIView] = colors.map {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.heightAnchor.constraint(equalToConstant: 20).isActive = true
            view.backgroundColor = $0
            return view
        }
        
        let stackview = UIStackView(arrangedSubviews: colorfulViews)
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        
        let alert = AssemblyAlertView(header: header, body: stackview, tail: tail)
        
        alert.backgroundColor = .init(white: 0, alpha: 0.6)
        alert.size = CGSize(width: 300, height: 210)

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
