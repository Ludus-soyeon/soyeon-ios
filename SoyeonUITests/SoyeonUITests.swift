//
//  SoyeonUITests.swift
//  SoyeonUITests
//
//  Created by 박은비 on 2021/09/26.
//  Copyright © 2021 ludus. All rights reserved.
//

import XCTest

class SoyeonUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }
 
    func testExample() throws {
        let app = XCUIApplication()
        app.launch() 
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
