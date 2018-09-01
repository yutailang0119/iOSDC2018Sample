//
//  UnownedReferenceTests.swift
//  iOSDC2018SampleUITests
//
//  Created by Yutaro Muta on 2018/08/31.
//  Copyright © 2018 Yutaro Muta. All rights reserved.
//

import XCTest

class UnownedReferenceTests: XCTestCase {

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()

    }

    override func tearDown() {
        super.tearDown()
    }

    func testUnownedReference() {
        let app = XCUIApplication()
        app.buttons["ParentViewController"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["unownedButton"]/*[[".buttons[\"Unowned\"]",".buttons[\"unownedButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["executeButton"].tap()
    }

}
