//
//  APITests.swift
//  SoyeonTests
//
//  Created by 박은비 on 2021/05/31.
//  Copyright © 2021 ludus. All rights reserved.
//

import XCTest
@testable import Soyeon

class APITests: XCTestCase {
    let waiter = XCTWaiter()
    let expectation = XCTestExpectation(description: "APIPrivoderTaskExpectation")

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testMbtiQuestions() throws {
        ProviderManager.reqeust(.mbtiQuestions,
                                Mbti.self) { (response) in
            XCTAssertTrue(response.questions.count < 0)
        } failer: { (error) in
            print(error.debugDescription)
            XCTAssertTrue((error != nil))
        }
         
        waiter.wait(for: [expectation], timeout: 5.0)
    }
 
}
