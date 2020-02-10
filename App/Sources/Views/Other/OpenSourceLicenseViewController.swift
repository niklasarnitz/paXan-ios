// Copyright © 2020 SWDEC. All rights reserved.

import UIKit

class OpenSourceLicenseViewController: UIViewController {
    private lazy var titleLabel = TitleLabel(text: config.openSourceViewTitle)
    private lazy var licenseTextLabel = SubtitleLabel(text: config.licenseText)
    private lazy var scrollView = UIScrollView()
    private lazy var doneButton = ThemedButton(text: "Fertig")

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Colors.ecGreen

        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }

        view.addSubview(doneButton)
        doneButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
        doneButton.backgroundColor = Colors.ecGreen
        doneButton.addTarget(self, action: #selector(doneButtonPressed), for: .touchUpInside)

        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottomMargin).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalTo(doneButton.snp.topMargin).offset(-20)
        }
        scrollView.addSubview(licenseTextLabel)
        licenseTextLabel.bindEdgesToSuperview()
        licenseTextLabel.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        licenseTextLabel.textAlignment = .left
        licenseTextLabel.contentMode = .left
    }

    @objc private func doneButtonPressed() {
        doneButton.pulsate()

        dismiss(animated: true)
    }
}
