// Copyright © 2019 SWDEC. All rights reserved.

import UIKit

class ReferentDetailViewController: UIViewController {
    private lazy var referentImages: [UIImage] = [
        #imageLiteral(resourceName: "göttler.png"),
        #imageLiteral(resourceName: "böker"),
        #imageLiteral(resourceName: "gäckle")
    ]

    private lazy var nameLabel = TitleLabel()
    private lazy var roundImageView = ProfilePictureImageView()
    private lazy var connectionCaptionLabel = SubtitleLabel(text: "Organisation: ")
    private lazy var websiteCaptionLabel = SubtitleLabel(text: "Website: ")
    private lazy var descriptionLabel = SubtitleLabel(text: "")
    private lazy var doneButton = SetupButton(text: "Fertig")
    private lazy var verticalViewController = VerticalViewController(
        arrangedSubviews: [
            nameLabel,
            roundImageView,
            connectionCaptionLabel,
            websiteCaptionLabel,
            descriptionLabel
        ]
    )

    init(referent: Referent) {
        super.init(nibName: nil, bundle: nil)

        roundImageView.image = maskRoundedImage(
            image: referentImages[Int(referent.picture)!],
            radius: referentImages[Int(referent.picture)!].size.height / 2
        )

        nameLabel.text = referent.name
        connectionCaptionLabel.text = "Organisation: " + referent.connection
        descriptionLabel.text = referent.description
        websiteCaptionLabel.text = "Website: " + referent.website
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Colors.ecGreen

        setupNameLabel()
        setupDoneButton()

        roundImageView.snp.makeConstraints { make in
            make.size.equalTo(view.bounds.width - 40)
        }

        view.addSubview(verticalViewController.view)
        verticalViewController.view.snp.makeConstraints { make in
            make.top.equalTo(view.snp.topMargin).offset(20)
            make.bottom.equalTo(doneButton.snp.topMargin).offset(-20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }

    private func setupImageView() {
        view.addSubview(roundImageView)
        roundImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 200, height: 200))
        }
    }

    private func setupNameLabel() {
        nameLabel.contentMode = .center
        nameLabel.textAlignment = .center
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

    private func maskRoundedImage(image: UIImage, radius: CGFloat) -> UIImage {
        let imageView = UIImageView(image: image)
        let layer = imageView.layer
        layer.masksToBounds = true
        layer.cornerRadius = radius
        UIGraphicsBeginImageContext(imageView.bounds.size)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let roundedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return roundedImage!
    }

    @objc private func doneButtonPressed() {
        doneButton.pulsate()
        dismiss(animated: true)
    }
}
