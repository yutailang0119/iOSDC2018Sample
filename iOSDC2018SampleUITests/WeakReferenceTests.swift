//
//  WeakReferenceTests.swift
//  iOSDC2018SampleUITests
//
//  Created by Yutaro Muta on 2018/08/31.
//  Copyright © 2018 Yutaro Muta. All rights reserved.
//

import XCTest

class WeakReferenceTests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()

    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testWeakReference() {
        let app = XCUIApplication()
        app.buttons["ParentViewController"].tap()
        app.buttons["weakButton"].tap()
        app.buttons["executeButton"].tap()
    }
    
}
