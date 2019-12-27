// Copyright © 2019 SWDEC. All rights reserved.

import UIKit.UITextField

class SetupTextField: UITextField {
    private var placeholderString: String
    /// Creates a subtitle label with the given text
    init(placeholder: String, target: Selector) {
        self.placeholderString = placeholder

        super.init(frame: .zero)

        self.addTarget(self, action: target, for: .editingChanged)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: UI Layout
    override func layoutSubviews() {
        super.layoutSubviews()

        textColor = .white
        attributedPlaceholder = NSAttributedString(
            string: placeholderString,
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5)
            ]
        )
        textAlignment = .center
        layer.borderWidth = 1
        layer.cornerRadius = 5
        layer.borderColor = UIColor.white.cgColor

        textColor = .white
    }
}
