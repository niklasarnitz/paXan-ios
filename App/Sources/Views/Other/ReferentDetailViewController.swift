// swiftlint:disable file_types_order empty_type 
// Copyright © 2019 SWDEC. All rights reserved.

import UIKit

class ReferentDetailViewController: UIViewController {
    private lazy var nameLabel = TitleLabel()
    private lazy var imageView = ProfilePictureImageView()
    private lazy var connectionCaptionLabel = SubtitleLabel(text: "Organisation: ")
    private lazy var websiteCaptionLabel = SubtitleLabel(text: "Website: ")
    private lazy var doneButton = SetupButton(text: "Fertig")

    init(referent: Referent) {
        super.init(nibName: nil, bundle: nil)

        let image = UIImage(named: referent.picture, in: Bundle(for: BundleToken.self), compatibleWith: nil)

        imageView.image = maskRoundedImage(image: image!, radius: image!.size.height / 2)

        nameLabel.text = referent.name
        connectionCaptionLabel.text = "Organisation: " + referent.connection
        websiteCaptionLabel.text = "Website: " + referent.website
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Colors.ecGreen

        setupImageView()
        setupNameLabel()
        setupConnectionCaptionLabel()
        setupWebsiteCaptionLabel()
        setupDoneButton()
    }

    private func setupImageView() {
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 200, height: 200))
        }
    }

    private func setupNameLabel() {
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottomMargin).offset(20)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }

        nameLabel.contentMode = .center
        nameLabel.textAlignment = .center
    }

    private func setupConnectionCaptionLabel() {
        view.addSubview(connectionCaptionLabel)
        connectionCaptionLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottomMargin).offset(20)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }

    private func setupWebsiteCaptionLabel() {
        view.addSubview(websiteCaptionLabel)
        websiteCaptionLabel.snp.makeConstraints { make in
            make.top.equalTo(connectionCaptionLabel.snp.bottomMargin).offset(20)
            make.centerX.equalToSuperview()
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

    @objc
    private func doneButtonPressed() {
        doneButton.pulsate()
        dismiss(animated: true)
    }
}

private final class BundleToken {}
