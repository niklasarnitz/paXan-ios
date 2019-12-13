// swiftlint:disable line_length
// Copyright © 2019 SWDEC. All rights reserved.

import UIKit

class ZeitplanViewController: UIViewController {
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()

        return scrollView
    }()

    // Thursday
    private lazy var thursdayCaptionLabel = EventLabel(text: "Donnerstag, 09. April 2020\n#heimatkunde")
    private lazy var thursdayEventLabel = EventBody(text: "19:30 Uhr paX an Start - Bibel Session\nmit Joachim Böker\n22:00 Uhr Darum feiern")

    // Friday
    private lazy var fridayCaptionLabel = EventLabel(text: "Freitag, 10. April 2020\n#heimatlos")
    private lazy var fridayEventLabelOne = EventBody(text: "09:30 Uhr Praxis Session / CoffeeTime\n11:30 Uhr Bibel Session mit Klaus Göttler\n15:00 Uhr Seminare I")
    private lazy var fridaySeminarOneButton = SeminarButton(text: "Seminar Eins")
    private lazy var fridayEventLabelTwo = EventBody(text: "16:30 Uhr Seminare II")
    private lazy var fridaySeminarTwoButton = SeminarButton(text: "Seminar Zwei")
    private lazy var fridayEventLabelThree = EventBody(text: "19:30 Uhr Das Kreuz")

    // Saturday
    private lazy var saturdayCaptionLabel = EventLabel(text: "Samstag, 11. April 2020\n#heimweh")
    private lazy var saturdayEventOneLabel = EventBody(text: "09:30 Uhr Bibel Session mit Joachim Böker\n11:30 Uhr Dennoch feiern\n14:00 Uhr Praxis Session / CoffeeTime\n16:30 Uhr Seminare III")
    private lazy var saturDaySemiarButton = SeminarButton(text: "Seminar Drei")
    private lazy var saturdayEventTwoLabel = EventBody(text: "19:30 Uhr Danke")

    // Sunday
    private lazy var sundayCaptionLabel = EventLabel(text: "Sonntag, 12. April 2020\n#heimweg")
    private lazy var sundayEventLabel = EventBody(text: "09:30 Uhr Bibel Session mit Volker Gäckle\n14:00 Uhr Praxis Session / CoffeeTime\n16:30 Uhr Trainings Session\n19:30 Uhr DELTA Endlos feiern")

    // Monday
    private lazy var mondayCaptionLabel = EventLabel(text: "Montag, 13. April 2020\n#heimatgeber")
    private lazy var mondayEventLabel = EventBody(text: "09:30 Uhr Abschluss-Session /\npaX an Finale")

    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }

        // TODO: Fix the navigatiobar on iOS 13. This is only a hotfix
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.title]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.title]
            navBarAppearance.backgroundColor = Colors.ecGreen
            super.navigationController?.navigationBar.standardAppearance = navBarAppearance
            super.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        }

        layoutSubViews()
    }

    private func layoutSubViews() {
        layoutScrollView()

        layoutThursdayCaptionLabel()
        layoutThursdayEventLabel()

        layoutFridayCaptionLabel()
        layoutFridayEventLabelOne()
        layoutFridaySeminarOneButton()
    }

    private func layoutScrollView() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.topMargin)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

    private func layoutThursdayCaptionLabel() {
        scrollView.addSubview(thursdayCaptionLabel)
        thursdayCaptionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }

    private func layoutThursdayEventLabel() {
        scrollView.addSubview(thursdayEventLabel)
        thursdayEventLabel.snp.makeConstraints { make in
            make.top.equalTo(thursdayCaptionLabel.snp.bottomMargin).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }

    private func layoutFridayCaptionLabel() {
        scrollView.addSubview(fridayCaptionLabel)
        fridayCaptionLabel.snp.makeConstraints { make in
            make.top.equalTo(thursdayEventLabel.snp.bottomMargin).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }

    private func layoutFridayEventLabelOne() {
        scrollView.addSubview(fridayEventLabelOne)
        fridayEventLabelOne.snp.makeConstraints { make in
            make.top.equalTo(fridayCaptionLabel.snp.bottomMargin).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }

    private func layoutFridaySeminarOneButton() {
        scrollView.addSubview(fridaySeminarOneButton!)
        fridaySeminarOneButton?.snp.makeConstraints { make in
            make.top.equalTo(fridayEventLabelOne.snp.bottomMargin).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
}
