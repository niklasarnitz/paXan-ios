//
//  Assets.swift
//  paXan
//
//  Created by Niklas Arnitz on 27.08.19.
//  Copyright © 2019 SWDEC. All rights reserved.
//

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
        internal static let ecGreen = UIColor(named: "ecGreen", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
        internal static let ecRed = UIColor(named: "ecRed", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
    }

    internal enum Images {
        internal static let ecLogoWhite = UIImage(named: "ecLogoWhite", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
        internal static let mapMarker = UIImage(named: "mapMarker", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
        internal static let timetable = UIImage(named: "timetable", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
        internal static let userMale = UIImage(named: "userMale", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
        internal static let userManual = UIImage(named: "userManual", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
        internal static let chevronRight = UIImage(named: "chevronRight", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
    }
}

// MARK: - Implementation Details

private final class BundleToken {}
