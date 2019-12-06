// Copyright © 2019 SWDEC. All rights reserved.

import UIKit

class AboutViewController: UIViewController {
    private lazy var titleLabel = TitleLabel(text: "Über")
    private lazy var doneButton = SetupButton(text: "Fertig")

    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 13.0, *) {
            view.backgroundColor = Colors.ecGreen
        } else {
            view.backgroundColor = Colors.ecGreen
        }

        setupTitleLabel()
        setupDoneButton()
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

    @objc
    private func doneButtonPressed() {
        doneButton.pulsate()

        dismiss(animated: true)
    }
}
