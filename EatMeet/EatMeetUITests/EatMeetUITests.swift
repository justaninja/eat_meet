//
//  EatMeetUITests.swift
//  EatMeetUITests
//
//  Created by Konstantin Khokhlov on 15.08.17.
//  Copyright © 2017 Konstantin Khokhlov. All rights reserved.
//

import XCTest

class EatMeetUITests: XCTestCase {

    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
}
