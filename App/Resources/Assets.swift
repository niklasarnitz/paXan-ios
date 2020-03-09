// Copyright © 2019 SWDEC. All rights reserved.

import UIKit.UIImage

// MARK: - Asset Catalogs

internal typealias Colors = Asset.Colors
internal typealias Images = Asset.Images

internal enum Asset {
    internal enum Colors {
        // MARK: - Branding
        internal static let ecGreen = #colorLiteral(red: 0.6823529412, green: 0.7960784314, blue: 0.2156862745, alpha: 1)
        internal static let ecRed = #colorLiteral(red: 0.8274509804, green: 0, blue: 0.2901960784, alpha: 1)

        // MARK: - Text
        internal static let body = #colorLiteral(red: 0.3176470588, green: 0.3137254902, blue: 0.3215686275, alpha: 1)
        internal static let bodyDescription = #colorLiteral(red: 0.6862745098, green: 0.6823529412, blue: 0.6862745098, alpha: 1)
        internal static let bodyHighlight = #colorLiteral(red: 0.3176470588, green: 0.3137254902, blue: 0.3215686275, alpha: 1)
        internal static let caption = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)
        internal static let shadow = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.1176470588, alpha: 1)
        internal static let background = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        internal static let secondaryBackground = #colorLiteral(red: 0.9098039216, green: 0.9058823529, blue: 0.9098039216, alpha: 1)
        internal static let stylishGrey = #colorLiteral(red: 0.2862745098, green: 0.2862745098, blue: 0.2862745098, alpha: 1)
    }

    internal enum Images {
        internal static let ecLogo = UIImage(named: "ecLogo", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
        internal static let upDownArrow = UIImage(named: "upDownArrow", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
        internal static let mapMarker = UIImage(named: "mapMarker", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
        internal static let timetable = UIImage(named: "timetable", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
        internal static let userMale = UIImage(named: "userMale", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
        internal static let userManual = UIImage(named: "userManual", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
        internal static let chevronRight = UIImage(named: "chevronRight", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
        internal static let deltaMap = UIImage(named: "deltaMap", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
        internal static let map = UIImage(named: "map", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
        internal static let info = UIImage(named: "info", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
        internal static let book = UIImage(named: "book", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
    }
    
    
}

// MARK: - Implementation Details

private final class BundleToken {}
