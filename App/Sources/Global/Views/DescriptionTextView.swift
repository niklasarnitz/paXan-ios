// Copyright © 2019 SWDEC. All rights reserved.

import UIKit

class DescriptionTextView: UITextView {
    // MARK: UI Layout
    override func layoutSubviews() {
        super.layoutSubviews()

        layer.borderColor = Colors.body.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 5
        layer.opacity = 15
        isEditable = false
    }
}
