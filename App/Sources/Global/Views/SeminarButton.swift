// Copyright © 2019 SWDEC. All rights reserved.

import UIKit

@IBDesignable
class SeminarButton: UIButton {
    @IBInspectable
    var titleText: String? {
        didSet {
            self.setTitle(titleText, for: .normal)
            self.setTitleColor(UIColor.black, for: .normal)
        }
    }

    var borderWidth: CGFloat = 1.0
    var borderRadius: CGFloat = 5.0
    var borderColor: CGColor = Colors.ecGreen.cgColor

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }

    func setup() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.borderRadius
        self.layer.borderColor = self.borderColor
        self.layer.borderWidth = self.borderWidth
    }
}
