//
//  OppositeSexProfileBasicAlertTests.swift
//  SoyeonTests
//
//  Created by 박은비 on 2021/09/23.
//  Copyright © 2021 ludus. All rights reserved.
//

import XCTest
@testable import Soyeon

final class OppositeSexProfileBasicAlertTests: XCTestCase {
    let waiter = XCTWaiter()
    let expectation = XCTestExpectation(description: "AlertTesting")
    
    let alertTestingView: UIView! = UIApplication.shared.soyeonWindowView

    func testShowUseHPInfoAlert() {
         
        let alert = SoyeonBasicAlertView.alert(message: "HP 10개가 소모됩니다.")!
        
        alert.action(style: .basic("하트 보내기")) {
            print("하트 보내기 액션")
        }
        .action(style: .cancel("취소"))
        .show(to: alertTestingView)
        
        waiter.wait(for: [expectation], timeout: 3.0)
        
        XCTAssertTrue( alertTestingView.contains(target: alert) )
    }
 
    func testShowLackOfHPNotiAlert() {
         
        let alert = SoyeonBasicAlertView.alert(message: """
            HP 3개가 모자랍니다.
            아이템을 충전하시겠어요?
        """)!
        
        alert.action(style: .basic("아이템 충전하기")) {
            print("아이템 충전하기 액션")
        }
        .action(style: .cancel("취소"))
        .show(to: alertTestingView)
        
        waiter.wait(for: [expectation], timeout: 3.0)
        
        XCTAssertTrue( alertTestingView.contains(target: alert) )
    }
    
    func testShowHeartSendiableAlert() {
        
        let changeWord = "상대방이 고민 사유를 보냈습니다.\n"
        
        let attr = NSMutableAttributedString(string: """
            상대방이 고민 사유를 보냈습니다.
            
            나의 어떤부분에서
            호감을 느꼈는지 궁금해서
            """)
            .regular(changeWord, fontSize: 11.0)
            .color(changeWord, color: UIColor(r: 102, g: 102, b: 102))
          
        let alert = SoyeonBasicAlertView.alert(message: attr)!
            .action(style: .basic("아이템 충전하기")) {
            print("아이템 충전하기 액션")
        }
        .action(style: .cancel("취소"))
        
        alert.show(to: alertTestingView)
        
        waiter.wait(for: [expectation], timeout: 3.0)
        
        XCTAssertTrue( alertTestingView.contains(target: alert) )
        
    }
    
    func testShowHPToast() {
        let toast = SoyeonToast.toast(text: "HP +1 획득!")
        toast?.show(to: alertTestingView)
        
        waiter.wait(for: [expectation], timeout: 1.0)
        
        XCTAssertTrue( alertTestingView.contains(target: toast!) )
    }
    
    func testShowMPToast() {
        let toast = SoyeonToast.toast(text: "MP +1 획득!")
        toast?.show(to: alertTestingView)
        waiter.wait(for: [expectation], timeout: 1.0)
        
        XCTAssertTrue( alertTestingView.contains(target: toast!) )
    }
}

fileprivate extension UIView {
    func contains(target view: UIView) -> Bool {
        return subviews.contains(where: { $0 === view })
    }
    
}

fileprivate extension NSMutableAttributedString {

    func regular(_ string: String, fontSize: CGFloat) -> NSMutableAttributedString {
        
        let range = NSString(string: self.string).range(of: string)
         
        let font = Fonts.nanumSquareR.size(fontSize)
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        
        addAttributes(attributes, range: range)
        return self
    }
    
    func color(_ string: String, color: UIColor) -> NSMutableAttributedString {
        let range = NSString(string: self.string).range(of: string)
         
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: color]
        
        addAttributes(attributes, range: range)
        
        return self
    }
    
    func baseline(_ string: String, with offset: CGFloat) -> NSMutableAttributedString {
        let range = NSString(string: self.string).range(of: string)
         
        let attributes: [NSAttributedString.Key: Any] = [.baselineOffset: offset]
        
        addAttributes(attributes, range: range)
        
        return self
    }
}
