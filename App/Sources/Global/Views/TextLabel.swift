// Copyright © 2019 SWDEC. All rights reserved.

import UIKit

class TextLabel: UILabel {
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    /// Creates a subtitle label with the given text
    init(text: String) {
        super.init(frame: .zero)
        self.text = text
    }

    // MARK: UI Layout
    override func layoutSubviews() {
        super.layoutSubviews()

        font = UIFont.preferredFont(forTextStyle: .body)
        numberOfLines = 0
        textAlignment = .left
        lineBreakMode = .byWordWrapping

        textColor = .white
    }
}
