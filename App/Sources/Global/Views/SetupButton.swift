// Copyright © 2019 SWDEC. All rights reserved.

import UIKit

@IBDesignable
class SetupButton: UIButton {
    @IBInspectable
    var titleText: String? {
        didSet {
            self.setTitle(titleText, for: .normal)
            self.setTitleColor(UIColor.white, for: .normal)
        }
    }

    var borderWidth: CGFloat = 1.0
    var borderColor: CGColor = UIColor.white.cgColor
    var borderRadius: CGFloat = 5.0

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
