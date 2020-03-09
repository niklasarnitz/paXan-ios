// Copyright © 2019 SWDEC. All rights reserved.

import UIKit

class DescriptionTextView: UILabel {
    // MARK: UI Layout
    override func layoutSubviews() {
        super.layoutSubviews()

        backgroundColor = Colors.ecGreen

        textColor = .white
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 0.5
        layer.cornerRadius = 5
        layer.opacity = 15
        lineBreakMode = .byWordWrapping
        numberOfLines = 0
        font = UIFont.buttonBody
    }

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        super.drawText(in: rect.inset(by: insets))
    }
}
