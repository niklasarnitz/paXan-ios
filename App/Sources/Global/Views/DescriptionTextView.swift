// Copyright © 2019 SWDEC. All rights reserved.

import UIKit

class DescriptionTextView: UITextView {
    // MARK: UI Layout
    override func layoutSubviews() {
        super.layoutSubviews()

        backgroundColor = Colors.ecGreen

        textColor = .white
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 0.5
        layer.cornerRadius = 5
        layer.opacity = 15
        font = UIFont(descriptor: .preferredFontDescriptor(withTextStyle: .body), size: 15)
        isEditable = false
    }
}
