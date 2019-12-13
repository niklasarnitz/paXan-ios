// swiftlint:disable operator_usage_whitespace too_much_unindentation
// Copyright © 2019 SWDEC. All rights reserved.

import UIKit

extension UIFont {
    // MARK: - Gloss and Bloom Font
    private static let glossAndBloomTitle           = UIFont(name: "GlossAndBloom", size: 10)!

    // MARK: - Nunito Font
    private static let nunito                       = UIFont(name: "Nunito-Regular", size: 10)!
    private static let nunitoExtraBoldItalic        = UIFont(name: "Nunito ExtraBold Italic", size: 10)!
    private static let nunitoExtraBold              = UIFont(name: "Nunito ExtraBold Regular", size: 10)!
    private static let nunitoExtraLightItalic       = UIFont(name: "Nunito ExtraLight Italic", size: 10)!
    private static let nunitoLight                  = UIFont(name: "Nunito ExtraLight Regular", size: 10)!
    private static let nunitoSemiBold               = UIFont(name: "Nunito SemiBold Regular", size: 10)!
    private static let nunitoBold                   = UIFont(name: "Nunito Bold", size: 10)!
    private static let nunitoBoldItalic             = UIFont(name: "Nunito Bold Italic", size: 10)!
    private static let nunitoBlack                  = UIFont(name: "Nunito Black Regular", size: 10)!
    private static let nunitoExtraLight             = UIFont(name: "Nunito ExtraLight Regular", size: 10)!
    private static let nunitoSemiBoldItalic         = UIFont(name: "Nunito SemiBold Italic", size: 10)!
    private static let nunitoBlackItalic            = UIFont(name: "Nunito Black Italic", size: 10)!
    private static let nunitoItalic                 = UIFont(name: "Nunito Italic", size: 10)!
    private static let nunitoLightItalic            = UIFont(name: "Nunito Light Italic", size: 10)!

    // MARK: - Font Styles
    static let title = UIFont.nunito.withSize(34)
    static let buttonBody = UIFont.nunito.withSize(UIFont.buttonFontSize)
    static let eventTitle = UIFont.nunito.withSize(25)
    static let eventBody = UIFont.nunito.withSize(UIFont.buttonFontSize)
}
