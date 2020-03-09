// swiftlint:disable multiline_arguments_brackets trailing_closure empty_type vertical_whitespaces_around_mark
// Copyright © 2019 SWDEC. All rights reserved.

import SnapKit
import UIKit

class InfoViewController: UIViewController {
    private lazy var referentButton = ThemedButton(text: "Referenten")
    private lazy var bandsButton = ThemedButton(text: "Bands")
    private lazy var seminarsButton = ThemedButton(text: "Seminare")
    private lazy var spendenButton = ThemedButton(text: "Spenden")
    private lazy var massquarterButton = ThemedButton(text: "Navigation Massenquartiere")
    private lazy var aboutButton = ThemedButton(text: "Über")

    private lazy var verticalViewController = VerticalViewController(
        arrangedSubviews: [
            referentButton,
            bandsButton,
            seminarsButton,
            spendenButton,
            massquarterButton
        ]
    )

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        title = "Info"

        configureNavigationBar()

        setupAboutButton()

        view.addSubview(verticalViewController.view)
        verticalViewController.view.snp.makeConstraints { make in
            make.top.equalTo(topLayoutGuide.snp.bottom).offset(20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(aboutButton.snp.topMargin).offset(-20)
        }

        referentButton.addTarget(self, action: #selector(referentButtonPressed), for: .touchUpInside)
        seminarsButton.addTarget(self, action: #selector(seminarsButtonPressed), for: .touchUpInside)
        spendenButton.addTarget(self, action: #selector(spendenButtonPressed), for: .touchUpInside)
        massquarterButton.addTarget(self, action: #selector(massQuarterButtonPressed), for: .touchUpInside)
        bandsButton.addTarget(self, action: #selector(didPressBandsButton), for: .touchUpInside)
    }

    private func setupAboutButton() {
        view.addSubview(aboutButton)
        aboutButton.snp.makeConstraints({ make in
            make.bottom.equalTo(bottomLayoutGuide.snp.top).offset(-30)
            make.leading.equalToSuperview().offset(26)
            make.trailing.equalToSuperview().offset(-26)
            make.height.equalTo(40)
        })
        aboutButton.addTarget(self, action: #selector(aboutButtonPressed), for: .touchUpInside)
    }

    @objc private func referentButtonPressed() {
        referentButton.pulsate()

        let viewController = ReferentTableViewController()

        present(viewController, animated: true)
    }

    @objc private func seminarsButtonPressed() {
        seminarsButton.pulsate()
        present(SeminarTableViewController(), animated: true)
    }

    @objc private func spendenButtonPressed() {
        spendenButton.pulsate()

        let url = URL(string: config.donationURL)!
        UIApplication.shared.open(url)
    }

    @objc private func massQuarterButtonPressed() {
        massquarterButton.pulsate()
        present(MassQuarterViewController(), animated: true)
    }

    @objc private func aboutButtonPressed() {
        aboutButton.pulsate()
        present(AboutViewController(), animated: true)
    }

    @objc private func didPressBandsButton() {
        bandsButton.pulsate()

        present(BandsViewController(), animated: true)
    }
}
