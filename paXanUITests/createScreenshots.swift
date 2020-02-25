//
//  createScreenshots.swift
//  paXanUITests
//
//  Created by Niklas Arnitz on 12.12.19.
//  Copyright © 2019 SWDEC. All rights reserved.
//

import XCTest

class CreateScreenshots: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()

        app = XCUIApplication()

        setupSnapshot(app)

        XCUIDevice.shared.orientation = .portrait

        app.launch()
    }

    func testScreenshots() {
        XCUIDevice.shared.orientation = .portrait

        app.buttons["Weiter"].tap()

        app.buttons["Weiter"].tap()

        app.buttons["Weiter"].tap()

        // Programm
        app.tabBars.buttons.element(boundBy: 0).tap()
        snapshot("0-Programm")

        // Karte
        app.tabBars.buttons.element(boundBy: 1).tap()
        snapshot("2-Karte")

        // Stille Zeit
        app.tabBars.buttons.element(boundBy: 2).tap()
        snapshot("3-StilleZeit")

        // A-Z
        app.tabBars.buttons.element(boundBy: 3).tap()
        snapshot("4-A-Z")

        // Infos
        app.tabBars.buttons.element(boundBy: 4).tap()
        snapshot("5-Infos")
    }

}
