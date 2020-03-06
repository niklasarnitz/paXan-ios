// Copyright © 2020 SWDEC. All rights reserved.

import SwiftyUserDefaults
import UIKit

class ZeitplanViewController: UIViewController, EditorsDelegate {
    private weak var editorsDelegate: EditorsDelegate?

    // Thursday
    private lazy var thursdayCaptionLabel = EventLabel(text: config.thursdayCaptionLabel)
    private lazy var thursdayEventLabelOne = EventBody(text: config.thursdayEventLabel)
    private lazy var thursdayEventLabelTwo = EventBody(text: "22:00 Uhr")
    private lazy var thursdayEventButton = ThemedButton(text: "Darum Feiern")
    private lazy var thursdayHorizontalStackView = UIStackView(
        arrangedSubviews: [
            thursdayEventLabelTwo,
            thursdayEventButton
        ]
    )

    // Friday
    private lazy var fridayCaptionLabel = EventLabel(text: config.fridayCaptionLabel)
    private lazy var fridayEventLabelOne = EventBody(text: config.fridayEventLabelTwo)
    private lazy var fridaySeminarOneButton = ThemedButton(text: Defaults.seminarOne.title)
    private lazy var fridayEventLabelTwo = EventBody(text: config.fridayEventLabelTwo)
    private lazy var fridaySeminarTwoButton = ThemedButton(text: Defaults.seminarTwo.title)
    private lazy var fridayEventLabelThree = EventBody(text: config.fridayEventLabelThree)

    // Saturday
    private lazy var saturdayCaptionLabel = EventLabel(text: config.saturdayCaptionLabel)
    private lazy var saturdayEventOneLabel = EventBody(text: config.saturdayEventOneLabel)
    private lazy var saturdaySeminarButton = ThemedButton(text: Defaults.seminarThree.title)
    private lazy var saturdayEventTwoLabel = EventBody(text: config.saturdayEventTwoLabel)
    private lazy var saturdayEventTwoButton = ThemedButton(text: "#DANKBAR")
    private lazy var saturdayHorizontalStackView = UIStackView(
        arrangedSubviews: [
            saturdayEventTwoLabel,
            saturdayEventTwoButton
        ]
    )

    // Sunday
    private lazy var sundayCaptionLabel = EventLabel(text: "Sonntag, 12. April 2020")
    private lazy var sundayCaptionButton = ThemedButton(text: "#heimweg")
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
            thursdayEventLabelOne,
            thursdayHorizontalStackView,
            fridayCaptionLabel,
            fridayEventLabelOne,
            fridaySeminarOneButton,
            fridayEventLabelTwo,
            fridaySeminarTwoButton,
            fridayEventLabelThree,
            saturdayCaptionLabel,
            saturdayEventOneLabel,
            saturdaySeminarButton,
            saturdayHorizontalStackView,
            sundayCaptionLabel,
            sundayCaptionButton,
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

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Bearbeiten", style: .plain, target: self, action: #selector(didPressEdit))

        navigationItem.rightBarButtonItem?.tintColor = .white
        navigationItem.rightBarButtonItem?.setTitleTextAttributes(
            [ .font: UIFont.eventTitle.withSize(18) ], for: .normal
        )

        view.backgroundColor = .white

        view.addSubview(scrollView)
        scrollView.bindEdgesToSuperview()
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(super.view.snp.topMargin).offset(20)
        }

        scrollView.addSubview(stackView)
        stackView.bindEdgesToSuperview()
        stackView.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }

        let horizontalStackviews = [ thursdayHorizontalStackView, saturdayHorizontalStackView ]
        horizontalStackviews.forEach { stackView in
            stackView.alignment = .leading
            stackView.axis = .horizontal
            stackView.distribution = .fill
            stackView.spacing = 5
            stackView.contentMode = .center

            stackView.arrangedSubviews.forEach { view in
                view.snp.makeConstraints { make in
                    make.centerY.equalToSuperview()
                }
            }
        }

        saturdayEventTwoButton.addTarget(self, action: #selector(didPressSaturdayEventTwoButton), for: .touchUpInside)

        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 15

        stackView.arrangedSubviews.forEach { view in
            view.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(20)
                make.trailing.equalToSuperview().offset(-20)
            }
        }

        thursdayEventButton.addTarget(self, action: #selector(didPressThursdayEventButton), for: .touchUpInside)
        fridaySeminarOneButton.addTarget(self, action: #selector(didPressSeminarOneButton), for: .touchUpInside)
        fridaySeminarTwoButton.addTarget(self, action: #selector(didPressSeminarTwoButton), for: .touchUpInside)
        saturdaySeminarButton.addTarget(self, action: #selector(didPressSeminarThreeButton), for: .touchUpInside)
        sundayEveningEventButton.addTarget(self, action: #selector(didPressDeltaMapButton), for: .touchUpInside)
        sundayCaptionButton.addTarget(self, action: #selector(didPressSundayCaptionButton), for: .touchUpInside)
    }

    @objc private func didPressThursdayEventButton() {
        thursdayEventButton.pulsate()

        let viewController = SimpleTextViewController(
            title: "Darum Feiern",
            text: "Halle: Nachtcafe/Talk mit Klaus Dieter Mauer\nZelthalle: Worship"
        )

        present(viewController, animated: true)
    }

    @objc private func didPressSeminarOneButton() {
        fridaySeminarOneButton.pulsate()

        var viewController = UIViewController(nibName: nil, bundle: nil)

        if !Defaults.seminarOne.url.isEmpty {
            viewController = SeminarWithLinkViewController(seminar: Defaults.seminarOne, url: Defaults.seminarOne.url)!
        } else {
            viewController = SeminarDetailViewController(seminar: Defaults.seminarOne)!
        }

        present(viewController, animated: true)
    }

    @objc private func didPressSeminarTwoButton() {
        fridaySeminarTwoButton.pulsate()

        var viewController = UIViewController(nibName: nil, bundle: nil)

        if !Defaults.seminarOne.url.isEmpty {
            viewController = SeminarWithLinkViewController(seminar: Defaults.seminarTwo, url: Defaults.seminarTwo.url)!
        } else {
            viewController = SeminarDetailViewController(seminar: Defaults.seminarTwo)!
        }

        present(viewController, animated: true)
    }

    @objc private func didPressSeminarThreeButton() {
        saturdaySeminarButton.pulsate()

        var viewController = UIViewController(nibName: nil, bundle: nil)

        if !Defaults.seminarOne.url.isEmpty {
            viewController = SeminarWithLinkViewController(seminar: Defaults.seminarThree, url: Defaults.seminarThree.url)!
        } else {
            viewController = SeminarDetailViewController(seminar: Defaults.seminarThree)!
        }

        present(viewController, animated: true)
    }

    @objc private func didPressSaturdayEventTwoButton() {
        saturdayEventTwoButton.pulsate()

        // swiftlint:disable line_length
        let viewController = SimpleTextViewController(
            title: "#dankbar",
            text: "Der Samstagabend steht unter dem Titel dankBAR. Wir sind dankBAR für unsere vielen Mitarbeiter, die sich in ihren Orten für ihre Kinder/Teens/junge Erwachsenen einsetzen.\nAn dem Abend wollen wir euch diese dankBARkeit etwas zeigen.\nWir werden den Abend innerhalb der KVs verbringen. Immer die zusammen, die zu einem Landesjugendreferenten gehören.\nEs soll ein entspannter Abend in entspannter Atmosphäre werden… wir freuen uns drauf!"
        )
        present(viewController, animated: true)
    }

    @objc private func didPressDeltaMapButton() {
        sundayEveningEventButton.pulsate()

        let viewController = DeltaMapViewController()
        present(viewController, animated: true)
    }

    @objc private func didPressSundayCaptionButton() {
        saturdayEventTwoButton.pulsate()

        // swiftlint:disable line_length
        let viewController = SimpleTextViewController(
            title: "#heimweg",
            text: "Der Herr ist auferstanden! – Er ist wahrhaftig auferstanden!\nWir wollen Maria und die Frauen begleiten, wie sie am 3. Tag nach Jesu Tod zum Grab gingen, und sehen, was sie dort erlebt haben. Sehr früh – vor dem Frühstück – haben sie sich aufgemacht. Genau das werden wir auch tun. Zwischen 7.30 Uhr und 9.00 Uhr könnt ihr euch auf den Weg machen und den Weg von ca. 45 Minuten mit den unterschiedlichen Stationen und Erlebnissen bestreiten. Im Anschluss könnt ihr euch bei einem ausgiebigen Frühstück stärken und dabei eure Stille Zeit machen.\nUm 10:30 Uhr feiern wir gemeinsam einen Oster-Gottesdienst, wo die Auferstehung Jesu im Mittelpunkt steht."
        )
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
