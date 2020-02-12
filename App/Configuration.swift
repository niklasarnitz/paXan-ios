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

    // MARK: - Timetable
    var heimwehTitle: String
    var thursdayCaptionLabel: String
    var thursdayEventLabel: String
    var fridayCaptionLabel: String
    var fridayEventLabelOne: String
    var fridayEventLabelTwo: String
    var fridayEventLabelThree: String
    var saturdayCaptionLabel: String
    var saturdayEventOneLabel: String
    var saturdayEventTwoLabel: String

    // MARK: - Donations
    var donationURL: String

    // MARK: - Licensing
    var openSourceViewTitle: String
    var licenseText: String

    // MARK: - Stille Zeit
    var stilleZeitDescription: String

    var fridayBibleTextTitle: String
    var fridayBibleText: String

    var saturdayBibleTextTitle: String
    var saturdayBibleText: String

    var sundayBibleTextTitle: String
    var sundayBibleText: String

    var mondayBibleTextTitle: String
    var mondayBibleText: String

    var appInfoString: String

    var impressumText: String

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
        // MARK: - Timetable Vars
        heimwehTitle = config!["heimwehTitle"] as! String
        thursdayCaptionLabel = config!["thursdayCaptionLabel"] as! String
        thursdayEventLabel = config!["thursdayEventLabel"] as! String
        fridayCaptionLabel = config!["fridayCaptionLabel"] as! String
        fridayEventLabelOne = config!["fridayEventLabelOne"] as! String
        fridayEventLabelTwo = config!["fridayEventLabelTwo"] as! String
        fridayEventLabelThree = config!["fridayEventLabelThree"] as! String
        saturdayCaptionLabel = config!["saturdayCaptionLabel"] as! String
        saturdayEventOneLabel = config!["saturdayEventOneLabel"] as! String
        saturdayEventTwoLabel = config!["saturdayEventTwoLabel"] as! String

        donationURL = config!["donationURL"] as! String

        openSourceViewTitle = config!["openSourceViewTitle"] as! String
        licenseText = config!["licenseText"] as! String


        fridayBibleTextTitle = config!["fridayBibleTextTitle"] as! String
        fridayBibleText = config!["fridayBibleText"] as! String

        saturdayBibleTextTitle = config!["saturdayBibleTextTitle"] as! String
        saturdayBibleText = config!["saturdayBibleText"] as! String

        sundayBibleTextTitle = config!["sundayBibleTextTitle"] as! String
        sundayBibleText = config!["sundayBibleText"] as! String

        mondayBibleTextTitle = config!["mondayBibleTextTitle"] as! String
        mondayBibleText = config!["mondayBibleText"] as! String

        stilleZeitDescription = config!["stilleZeitDescription"] as! String

        appInfoString = config!["appInfoString"] as! String

        impressumText = config!["impressumText"] as! String
    }
}

var config = Configuration()
