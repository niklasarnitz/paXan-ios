// swiftlint:disable line_length
// Copyright © 2019 SWDEC. All rights reserved.

import UIKit

class BandsViewController: UIViewController {
    private lazy var titleLabel = TitleLabel(text: "Bands")
    private lazy var descriptionLabel = SubtitleLabel(text: "Tippe auf den jeweiligen Namen, mehr über die Band zu erfahren!")
    private lazy var bandHalleButton = ThemedButton(text: "BAND VERANSTALTUNGSHALLE")
    private lazy var bandZeltButton = ThemedButton(text: "BAND VERANSTALTUNGSZELT")

    private lazy var verticalView = VerticalViewController(
        arrangedSubviews: [
            descriptionLabel,
            bandHalleButton,
            bandZeltButton
        ]
    )

    private lazy var doneButton = SetupButton(text: "Fertig")

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

        bandHalleButton.addTarget(self, action: #selector(didPressHalleButton), for: .touchUpInside)
        bandZeltButton.addTarget(self, action: #selector(didPressZeltButton), for: .touchUpInside)
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

    @objc private func didPressZeltButton() {
        bandZeltButton.pulsate()

        let viewController = BandViewController(
            title: "Jugo-Band des EC-Kreisverbands Mühlacker-Mühlhausen",
            text: "Wir lieben es, gemeinsam zu entdecken und zu erfahren, was es heißt, Gott anzubeten. Zu Hause sind wir im Kreisverband Mühlacker-Mühlhausen. Dort sind wir bei den regelmäßigen Jugendgottesdiensten am Start.",
            imageName: "bandZelt"
        )

        present(viewController, animated: true)
    }

    @objc private func didPressHalleButton() {
        bandHalleButton.pulsate()

        let viewController = BandViewController(
            title: "Hausbau (EC Remchingen)",
            text: "Hausbau ist ein Kollektiv aus Musikern, das in Wilferdingen zusammengefunden hat. Gemeinsam wollen wir durch die Musik Raum zur Begegnung mit Gott schaffen. Es ist unser Anliegen, für jeden die Kraft und Tiefe der Texte begreifbar zu machen, die im Zusammenspiel mit Musik zum Lob Gottes entstehen. Dadurch sollen Menschen berührt und nachhaltig verändert werden.",
            imageName: "bandHalle"
        )

        present(viewController, animated: true)
    }

    @objc private func doneButtonPressed() {
        doneButton.pulsate()

        dismiss(animated: true)
    }
}
