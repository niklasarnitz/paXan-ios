// Copyright © 2019 SWDEC. All rights reserved.

import UIKit

class AboutViewController: UIViewController {
    private lazy var titleLabel = TitleLabel(text: "Über")
    private lazy var descriptionLabel = TextLabel(text: config.appInfoString)
    private lazy var impressumButton = ThemedButton(text: "Impressum")
    private lazy var licenseButton = ThemedButton(text: "Open-Source Lizenzen")
    private lazy var doneButton = SetupButton(text: "Fertig")

    private lazy var verticalView = VerticalViewController(
        arrangedSubviews: [
            impressumButton,
            licenseButton
        ]
    )

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

        impressumButton.addTarget(self, action: #selector(didPressImpressumButton), for: .touchUpInside)
        licenseButton.addTarget(self, action: #selector(didPressOpenSourceLicensesButton), for: .touchUpInside)
        doneButton.addTarget(self, action: #selector(doneButtonPressed), for: .touchUpInside)
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

    @objc private func didPressImpressumButton() {
        impressumButton.pulsate()

        let viewController = SimpleTextViewController(title: "Impressum", text: config.impressumText)

        present(viewController, animated: true)
    }

    @objc private func didPressOpenSourceLicensesButton() {
        licenseButton.pulsate()

        let viewController = OpenSourceLicenseViewController()

        present(viewController, animated: true)
    }

    @objc private func doneButtonPressed() {
        doneButton.pulsate()

        dismiss(animated: true)
    }
}
