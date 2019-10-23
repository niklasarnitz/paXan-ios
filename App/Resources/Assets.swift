// Copyright © 2019 SWDEC. All rights reserved.

#if os(OSX)
    import AppKit.NSImage
#elseif os(iOS) || os(tvOS) || os(watchOS)
    import UIKit.UIImage
#endif

// MARK: - Asset Catalogs

internal typealias Colors = Asset.Colors
internal typealias Images = Asset.Images

internal enum Asset {
    internal enum Colors {
        // MARK: - Branding
        internal static let ecGreen = UIColor(named: "ecGreen", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
        internal static let ecRed = UIColor(named: "ecRed", in: Bundle(for: BundleToken.self), compatibleWith: nil)!

        // MARK: - Text
        internal static let body = UIColor(named: "body", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
        internal static let bodyDescription = UIColor(named: "bodyDescription", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
        internal static let bodyHighlight = UIColor(named: "bodyHighlight", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
        internal static let caption = UIColor(named: "caption", in: Bundle(for: BundleToken.self), compatibleWith: nil)
        internal static let shadow = UIColor(named: "shadow", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
        internal static let background = UIColor(named: "background", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
        internal static let secondaryBackground = UIColor(named: "secondaryBackground", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
    }

    internal enum Images {
        internal static let ecLogo = UIImage(named: "ecLogo", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
        internal static let mapMarker = UIImage(named: "mapMarker", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
        internal static let timetable = UIImage(named: "timetable", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
        internal static let userMale = UIImage(named: "userMale", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
        internal static let userManual = UIImage(named: "userManual", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
        internal static let chevronRight = UIImage(named: "chevronRight", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
    }
}

// MARK: - Implementation Details

private final class BundleToken {}
