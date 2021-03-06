// Copyright © 2019 SWDEC. All rights reserved.

import UIKit

class EventBody: UILabel {
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    /// Creates a title label with the given text
    init(text: String) {
        super.init(frame: .zero)
        self.text = text
    }

    // MARK: UI Layout
    override func layoutSubviews() {
        super.layoutSubviews()

        font = .eventBody

        lineBreakMode = .byWordWrapping
        numberOfLines = 0

        self.setTextColor(color: Colors.stylishGrey)
    }

    func setTextColor(color: UIColor) {
        textColor = color
    }
}
