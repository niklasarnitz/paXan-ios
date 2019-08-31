//
//  Style.swift
//  paXan
//
//  Created by Niklas Arnitz on 31.08.19.
//  Copyright © 2019 SWDEC. All rights reserved.
//

import UIKit

enum Style {
    // MARK: - CornerRadius
    static let defaultCornerRadius: CGFloat = 5

    // MARK: - Shadow
    static let defaultShadowColor: CGColor = UIColor.black.cgColor
    static let defaultShadowOpacity: Float = 0.25
    static let defaultShadowOffset = CGSize(width: 1, height: 1)
    static let defaultShadowRadius: CGFloat = 2.5

    static func addShadow(to view: UIView) {
        view.layer.shadowColor = defaultShadowColor
        view.layer.shadowOpacity = defaultShadowOpacity
        view.layer.shadowRadius = defaultShadowRadius
        view.layer.shadowOffset = defaultShadowOffset
    }

    static func roundCorners(of view: UIView) {
        view.layer.cornerRadius = defaultCornerRadius
    }
}
