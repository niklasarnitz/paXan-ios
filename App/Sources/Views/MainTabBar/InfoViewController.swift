// swiftlint:disable multiline_arguments_brackets trailing_closure empty_type vertical_whitespaces_around_mark
// Copyright © 2019 SWDEC. All rights reserved.

import SnapKit
import UIKit

class InfoViewController: UIViewController {
    private lazy var referentButton = ThemedButton(text: "Referenten")
    private lazy var seminarsButton = ThemedButton(text: "Seminare")
    private lazy var spendenButton = ThemedButton(text: "Spenden")
    private lazy var massquarterButton = ThemedButton(text: "Massenquatiere")
    private lazy var aboutButton = ThemedButton(text: "Über")

    private lazy var stackView = UIStackView(
        arrangedSubviews: [
            referentButton,
            seminarsButton,
            spendenButton,
            massquarterButton
        ]
    )

    private lazy var scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        fixNavigationBar()

        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(super.view.snp.topMargin).offset(20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        scrollView.addSubview(stackView)
        stackView.bindEdgesToSuperview()
        stackView.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }

        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 15

        stackView.arrangedSubviews.forEach { view in
            view.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(20)
                make.trailing.equalToSuperview().offset(-20)
            }
        }

        setupAboutButton()

        referentButton.addTarget(self, action: #selector(referentButtonPressed), for: .touchUpInside)
        seminarsButton.addTarget(self, action: #selector(seminarsButtonPressed), for: .touchUpInside)
        spendenButton.addTarget(self, action: #selector(spendenButtonPressed), for: .touchUpInside)
        massquarterButton.addTarget(self, action: #selector(massQuarterButtonPressed), for: .touchUpInside)
    }

    private func setupAboutButton() {
        view.addSubview(aboutButton)
        aboutButton.snp.makeConstraints({ make in
            make.bottom.equalTo(super.view.snp.bottomMargin).offset(-30)
            make.leading.equalToSuperview().offset(26)
            make.trailing.equalToSuperview().offset(-26)
            make.height.equalTo(40)
        })
        aboutButton.addTarget(self, action: #selector(aboutButtonPressed), for: .touchUpInside)
    }

    @objc
    private func referentButtonPressed() {
        referentButton.pulsate()

        let viewController = ReferentTableViewController()

        present(viewController, animated: true)
    }

    @objc
    private func seminarsButtonPressed() {
        seminarsButton.pulsate()
        present(SeminarTableViewController(), animated: true)
    }

    @objc
    private func spendenButtonPressed() {
        spendenButton.pulsate()

        let url = URL(string: config.donationURL)!
        UIApplication.shared.open(url)
    }

    @objc
    private func massQuarterButtonPressed() {
        massquarterButton.pulsate()
        present(MassQuarterViewController(), animated: true)
    }

    @objc
    private func aboutButtonPressed() {
        aboutButton.pulsate()
        present(AboutViewController(), animated: true)
    }
}
