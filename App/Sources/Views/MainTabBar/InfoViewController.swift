// swiftlint:disable multiline_arguments_brackets trailing_closure empty_type vertical_whitespaces_around_mark
// Copyright © 2019 SWDEC. All rights reserved.

import SnapKit
import UIKit

class InfoViewController: UIViewController {
    private lazy var referentButton = SeminarButton(text: "Referenten")

    private lazy var seminarsButton = SeminarButton(text: "Seminare")

    private lazy var spendenButton = SeminarButton(text: "Spenden")

    private lazy var massquarterButton = SeminarButton(text: "Massenquatiere")

    private lazy var aboutButton = SeminarButton(text: "Über")

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        fixNavigationBar()

        setupReferentButton()
        setupSeminarsButton()
        setupSpendenButton()
        setupMassquarterButton()
        setupAboutButton()
    }

    private func setupReferentButton() {
        view.addSubview(referentButton)
        referentButton.snp.makeConstraints({ make in
            make.top.equalTo(super.view.snp.topMargin).offset(30)
            make.leading.equalToSuperview().offset(26)
            make.trailing.equalToSuperview().offset(-26)
            make.height.equalTo(40)
        })

        referentButton.addTarget(self, action: #selector(referentButtonPressed), for: .touchUpInside)
    }

    private func setupSeminarsButton() {
        view.addSubview(seminarsButton)
        seminarsButton.snp.makeConstraints({ make in
            make.top.equalTo(referentButton.snp.bottomMargin).offset(26)
            make.leading.equalToSuperview().offset(26)
            make.trailing.equalToSuperview().offset(-26)
            make.height.equalTo(40)
        })

        seminarsButton.addTarget(self, action: #selector(seminarsButtonPressed), for: .touchUpInside)
    }

    private func setupSpendenButton() {
        view.addSubview(spendenButton)
        spendenButton.snp.makeConstraints({ make in
            make.top.equalTo(seminarsButton.snp.bottomMargin).offset(26)
            make.leading.equalToSuperview().offset(26)
            make.trailing.equalToSuperview().offset(-26)
            make.height.equalTo(40)
        })

        spendenButton.addTarget(self, action: #selector(spendenButtonPressed), for: .touchUpInside)
    }

    private func setupMassquarterButton() {
        view.addSubview(massquarterButton)
        massquarterButton.snp.makeConstraints({ make in
            make.top.equalTo(spendenButton.snp.bottomMargin).offset(26)
            make.leading.equalToSuperview().offset(26)
            make.trailing.equalToSuperview().offset(-26)
        })

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

        let url = URL(string: "https://www.swdec.de/spenden/")!
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
