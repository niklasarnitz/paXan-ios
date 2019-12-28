// Copyright © 2019 SWDEC. All rights reserved.

import UIKit.UITextField

class SeminarPickerTextField: UITextField {
    private var pickerView: UIPickerView
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: Images.upDownArrow)
        imageView.tintColor = .white
        return imageView
    }()

    /// Creates a SeminarPickerTextView with the given placeholder and target
    init(placeholder: String, pickerView: UIPickerView) {
        self.pickerView = pickerView

        super.init(frame: .zero)

        self.placeholder = text
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
            string: "",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5)
            ]
        )
        textAlignment = .center
        layer.borderWidth = 1
        layer.cornerRadius = 5
        layer.borderColor = UIColor.white.cgColor
        inputView = pickerView

        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-10)
            make.centerX.equalToSuperview()
        }
    }
}
