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
    init?(text: String) {
        super.init(frame: .zero)
        self.text = text
    }

    // MARK: UI Layout
    override func layoutSubviews() {
        super.layoutSubviews()

        font = UIFont.preferredFont(forTextStyle: .largeTitle)
        textColor = .white
        numberOfLines = 0
    }
}
