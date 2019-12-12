// Copyright © 2019 SWDEC. All rights reserved.

import UIKit

class TitleLabel: UILabel {
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

        font = .title
        numberOfLines = 0

        if #available(iOS 13.0, *) {
            self.setTextColor(color: UIColor.label)
        } else {
            self.setTextColor(color: .white)
        }
    }

    func setTextColor(color: UIColor) {
        textColor = color
    }
}
