// swiftlint:disable all
// Copyright © 2020 SWDEC. All rights reserved.
import UIKit

class BandViewController: UIViewController {
    private var image: UIImage

    private lazy var titleLabel = TitleLabel(text: "")
    private lazy var bandImageView = SelfSizedImageView(image: UIImage())
    private lazy var descriptionLabel = SubtitleLabel(text: "")
    private lazy var verticalView = VerticalViewController(
        arrangedSubviews: [
            bandImageView,
            descriptionLabel
        ]
    )
    private lazy var doneButton = SetupButton(text: "Fertig")

    init(title: String, text: String, imageName: String) {
        self.image = UIImage(named: imageName, in: Bundle(for: BundleToken.self), compatibleWith: nil)!

        super.init(nibName: nil, bundle: nil)

        titleLabel.text = title
        descriptionLabel.text = text
        bandImageView.image = image
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Colors.ecGreen

        setupTitleLabel()
        setupDoneButton()

        view.addSubview(verticalView.view)
        verticalView.view.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottomMargin).offset(20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(doneButton.snp.topMargin).offset(-20)
        }

        bandImageView.layoutSubviews()
        bandImageView.layer.cornerRadius = 10
    }

    private func setupTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }

    private func setupDoneButton() {
        view.addSubview(doneButton)
        doneButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }

        doneButton.addTarget(self, action: #selector(doneButtonPressed), for: .touchUpInside)
    }

    @objc private func doneButtonPressed() {
        doneButton.pulsate()

        dismiss(animated: true)
    }
}

class SelfSizedImageView: UIImageView {

    override func layoutSubviews() {
        super.layoutSubviews()

        guard let imageSize = image?.size else {
            return
        }

        let viewBounds = bounds
        let imageFactor = imageSize.width / imageSize.height
        let newHeight = viewBounds.width / imageFactor

        let myWidthConstraint = self.constraints.first(where: { $0.firstAttribute == .height })
        myWidthConstraint?.constant = min(newHeight, newHeight)

        layoutIfNeeded()
    }
}

private final class BundleToken {}
