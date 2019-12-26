//
//  paXanUITests.swift
//  paXanUITests
//
//  Created by Niklas Arnitz on 12.12.19.
//  Copyright © 2019 SWDEC. All rights reserved.
//

import XCTest

class PaXanUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {
        super.setUp()

        app = XCUIApplication()

        setupSnapshot(app)

        XCUIDevice.shared.orientation = .portrait

        app.launch()
    }

    func testTabBar() {
        // Mein paXan
        app.tabBars.buttons.element(boundBy: 0).tap()

        // Seminarplan
        app.tabBars.buttons.element(boundBy: 1).tap()

        // Karte
        app.tabBars.buttons.element(boundBy: 2).tap()

        // A-Z
        app.tabBars.buttons.element(boundBy: 3).tap()

        // Infos
        app.tabBars.buttons.element(boundBy: 4).tap()
    }

    func testSeminarPlan() {
        app.tabBars.buttons.element(boundBy: 1).tap()

        app.buttons["Einladend gestalten"].tap()

        app.buttons["Fertig"].tap()
    }
}
