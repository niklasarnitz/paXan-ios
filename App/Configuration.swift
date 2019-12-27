// Copyright © 2019 SWDEC. All rights reserved.

import Foundation

final class Configuration {
    private var config: NSDictionary?

    // MARK: - Backend
    var seminarUrl: URL
    var lexikonUrl: URL
    var speakerUrl: URL

    // MARK: - Setup Assistant
    var setupContinueButtonTitle: String
    // MARK: - First Page
    var firstPageTitle: String
    var firstPageSubtitle: String

    // MARK: - Second Page
    var secondPageTitle: String
    var secondPageSubtitle: String
    var secondPageTextFieldPlaceholder: String

    // MARK: - Third Page
    var thirdPageTitle: String
    var thirdPageSubtitle: String
    var thirdPageTextFieldPlaceholderOne: String
    var thirdPageTextFieldPlaceholderTwo: String
    var thirdPageTextFieldPlaceholderThree: String

    // MARK: - Tabs
    // MARK: Mein paXan
    var meinPaXanTitle: String

    // MARK: - Timetable
    var heimwehTitle: String

    init() {
        if let path = Bundle.main.path(forResource: "Config", ofType: "plist") {
           config = NSDictionary(contentsOfFile: path)
        }

        // MARK: - Backend Vars
        seminarUrl = URL(string: config!["seminarUrl"] as! String)!
        lexikonUrl = URL(string: config!["lexikonUrl"] as! String)!
        speakerUrl = URL(string: config!["speakerUrl"] as! String)!

        // MARK: - Setup Assistant Vars
        setupContinueButtonTitle = config!["setupContinueButtonTitle"] as! String

        // MARK: - First Page Vars
        firstPageTitle = config!["firstPageTitle"] as! String
        firstPageSubtitle = config!["firstPageSubtitle"] as! String

        // MARK: - Second Page Vars
        secondPageTitle = config!["secondPageTitle"] as! String
        secondPageSubtitle = config!["secondPageSubtitle"] as! String
        secondPageTextFieldPlaceholder = config!["secondPageTextFieldPlaceholder"] as! String

        // MARK: - Third Page Vars
        thirdPageTitle = config!["thirdPageTitle"] as! String
        thirdPageSubtitle = config!["thirdPageSubtitle"] as! String
        thirdPageTextFieldPlaceholderOne = config!["thirdPageTextFieldPlaceholderOne"] as! String
        thirdPageTextFieldPlaceholderTwo = config!["thirdPageTextFieldPlaceholderTwo"] as! String
        thirdPageTextFieldPlaceholderThree = config!["thirdPageTextFieldPlaceholderThree"] as! String

        // MARK: - Tabs Vars
        // MARK: - Mein paXan Vars
        meinPaXanTitle = config!["meinPaXanTitle"] as! String

        // MARK: - Timetable Vars
        heimwehTitle = config!["heimwehTitle"] as! String
    }
}

var config = Configuration()
