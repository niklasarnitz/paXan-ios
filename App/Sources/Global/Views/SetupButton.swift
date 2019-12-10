// Copyright © 2019 SWDEC. All rights reserved.

import UIKit

/// A custom styled Button for the setup views
class SetupButton: UIButton {
    // MARK: Instance Properties
    /// Title of the Button
    var titleText: String? {
        didSet {
            setTitle(titleText, for: .normal)
            setTitleColor(UIColor.white, for: .normal)
        }
    }

    // MARK: Layer Properties
    var borderWidth: CGFloat = 1.0
    var borderColor: CGColor = UIColor.white.cgColor
    var borderRadius: CGFloat = 5.0

    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    init(text: String) {
        super.init(frame: .zero)
        setTitle(text, for: .normal)
    }

    // MARK: UI Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        clipsToBounds = true
        layer.cornerRadius = borderRadius
        layer.borderColor = borderColor
        layer.borderWidth = borderWidth

        titleLabel?.font = UIFont.buttonBody
    }
}
