// Copyright © 2019 SWDEC. All rights reserved.

import UIKit

class SeminarPickerViewTextField: UITextField {
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    /// Creates a pickerview with the given placeholder and pickerview
    init(placeholder: String, pickerView: UIPickerView) {
        super.init(frame: .zero)
        attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [ NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5) ]
        )

        inputView = pickerView
    }

    // MARK: UI Layout
    override func layoutSubviews() {
        super.layoutSubviews()

        textColor = .white
        textAlignment = .center
        layer.borderWidth = 1
        layer.cornerRadius = 5
        layer.borderColor = UIColor.white.cgColor
        rightViewMode = .always
        rightView = {
            let imageView = UIImageView(image: Images.upDownArrow)
            imageView.tintColor = .white
            return imageView
        }()
    }
}
