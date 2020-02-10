// swiftlint:disable operator_usage_whitespace too_much_unindentation
// Copyright © 2019 SWDEC. All rights reserved.

import UIKit

extension UIFont {
    // MARK: - Nunito Font
    private static let nunito                       = UIFont(name: "Nunito-Regular", size: 10)!

    // MARK: - Font Styles
    static let title = UIFont.nunito.withSize(34)
    static let titleView = UIFont.nunito.withSize(16)
    static let buttonBody = UIFont.nunito.withSize(UIFont.buttonFontSize)
    static let eventTitle = UIFont.nunito.withSize(25)
    static let eventBody = UIFont.nunito.withSize(UIFont.buttonFontSize)
}
