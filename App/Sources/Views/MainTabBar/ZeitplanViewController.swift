// Copyright © 2020 SWDEC. All rights reserved.

import SwiftyUserDefaults
import UIKit

class ZeitplanViewController: UIViewController, EditorsDelegate {
    private weak var editorsDelegate: EditorsDelegate?

    // Thursday
    private lazy var thursdayCaptionLabel = EventLabel(text: config.thursdayCaptionLabel)
    private lazy var thursdayEventLabel = EventBody(text: config.thursdayEventLabel)

    // Friday
    private lazy var fridayCaptionLabel = EventLabel(text: config.fridayCaptionLabel)
    private lazy var fridayEventLabelOne = EventBody(text: config.fridayEventLabelTwo)
    private lazy var fridaySeminarOneButton = ThemedButton(text: Defaults.seminarOne.title)
    private lazy var fridayEventLabelTwo = EventBody(text: config.fridayEventLabelTwo)
    private lazy var fridaySeminarTwoButton = ThemedButton(text: Defaults.seminarTwo.title)
    private lazy var fridayEventLabelThree = EventBody(text: config.fridayEventLabelThree)

    // Saturday
    private lazy var saturdayCaptionLabel = EventLabel(text: config.saturdayCaptionLabel)
    private lazy var saturdayEventOneLabel = EventBody(
        text: config.saturdayEventOneLabel
    )
    private lazy var saturdaySeminarButton = ThemedButton(text: Defaults.seminarThree.title)
    private lazy var saturdayEventTwoLabel = EventBody(text: config.saturdayEventTwoLabel)

    // Sunday
    private lazy var sundayCaptionLabel = EventLabel(text: "Sonntag, 12. April 2020\n#heimweg")
    private lazy var sundayEventLabel = EventBody(
        text: "09:30 Uhr Bibel Session mit Volker Gäckle\n14:00 Uhr Praxis Session / CoffeeTime\n16:30 Uhr Trainings Session\n19:30 Uhr DELTA Endlos feiern"
    )
    private lazy var sundayEveningEventButton = ThemedButton(text: "DELTA - KARTE")

    // Monday
    private lazy var mondayCaptionLabel = EventLabel(text: "Montag, 13. April 2020\n#heimatgeber")
    private lazy var mondayEventLabel = EventBody(text: "09:30 Uhr Abschluss-Session /\npaX an Finale")

    private lazy var stackView = UIStackView(
        arrangedSubviews: [
            thursdayCaptionLabel,
            thursdayEventLabel,
            fridayCaptionLabel,
            fridayEventLabelOne,
            fridaySeminarOneButton,
            fridayEventLabelTwo,
            fridaySeminarTwoButton,
            fridayEventLabelThree,
            saturdayCaptionLabel,
            saturdayEventOneLabel,
            saturdaySeminarButton,
            saturdayEventTwoLabel,
            sundayCaptionLabel,
            sundayEventLabel,
            sundayEveningEventButton,
            mondayCaptionLabel,
            mondayEventLabel
        ]
    )

    private lazy var scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()

        fixNavigationBar()

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Bearbeiten",
            style: .plain,
            target: self,
            action: #selector(didPressEdit)
        )

        navigationItem.rightBarButtonItem?.tintColor = .white
        navigationItem.rightBarButtonItem?.setTitleTextAttributes(
            [ .font: UIFont.eventTitle.withSize(18) ], for: .normal
        )

        view.backgroundColor = .white

        view.addSubview(scrollView)
        scrollView.bindEdgesToSuperview()

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

        fridaySeminarOneButton.addTarget(self, action: #selector(didPressSeminarOneButton), for: .touchUpInside)
        fridaySeminarTwoButton.addTarget(self, action: #selector(didPressSeminarTwoButton), for: .touchUpInside)
        saturdaySeminarButton.addTarget(self, action: #selector(didPressSeminarThreeButton), for: .touchUpInside)
        sundayEveningEventButton.addTarget(self, action: #selector(didPressDeltaMapButton), for: .touchUpInside)
    }

    @objc private func didPressSeminarOneButton() {
        fridaySeminarOneButton.pulsate()

        let viewController = SeminarDetailViewController(seminar: Defaults.seminarOne)!
        present(viewController, animated: true)
    }

    @objc private func didPressSeminarTwoButton() {
        fridaySeminarTwoButton.pulsate()

        let viewController = SeminarDetailViewController(seminar: Defaults.seminarTwo)!
        present(viewController, animated: true)
    }

    @objc private func didPressSeminarThreeButton() {
        saturdaySeminarButton.pulsate()

        let viewController = SeminarDetailViewController(seminar: Defaults.seminarThree)!
        present(viewController, animated: true)
    }

    @objc private func didPressDeltaMapButton() {
        sundayEveningEventButton.pulsate()

        let viewController = DeltaMapViewController()
        present(viewController, animated: true)
    }

    @objc private func didPressEdit() {
        let viewController = SeminarsEditViewController(delegate: self)!
        present(viewController, animated: true)
    }

    func updateData() {
        fridaySeminarOneButton.titleText = Defaults.seminarOne.title
        fridaySeminarTwoButton.titleText = Defaults.seminarTwo.title
        saturdaySeminarButton.titleText = Defaults.seminarThree.title
    }
}
