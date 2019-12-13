// swiftlint:disable line_length
// Copyright © 2019 SWDEC. All rights reserved.

import SwiftyUserDefaults
import UIKit

class ZeitplanViewController: UIViewController, EditorsDelegate {
    private weak var editorsDelegate: EditorsDelegate?

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
    private lazy var saturdaySeminarButton = SeminarButton(text: "Seminar Drei")
    private lazy var saturdayEventTwoLabel = EventBody(text: "19:30 Uhr Danke")

    // Sunday
    private lazy var sundayCaptionLabel = EventLabel(text: "Sonntag, 12. April 2020\n#heimweg")
    private lazy var sundayEventLabel = EventBody(text: "09:30 Uhr Bibel Session mit Volker Gäckle\n14:00 Uhr Praxis Session / CoffeeTime\n16:30 Uhr Trainings Session\n19:30 Uhr DELTA Endlos feiern")
    private lazy var sundayEveningEventButton = SeminarButton(text: "DELTA - KARTE")

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

        editorsDelegate = self

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

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Bearbeiten", style: .plain, target: self, action: #selector(didPressEdit))
        navigationItem.rightBarButtonItem?.tintColor = .white
        navigationItem.rightBarButtonItem?.setTitleTextAttributes([ .font: UIFont.eventTitle.withSize(18) ], for: .normal)

        layoutSubViews()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        scrollView.contentSize = CGSize(width: view.bounds.width, height: ( view.bounds.height + mondayEventLabel.bounds.maxX ))
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        scrollView.contentSize = CGSize(width: view.bounds.width, height: ( view.bounds.height + mondayEventLabel.bounds.maxX ))
    }

    private func layoutSubViews() {
        layoutScrollView()

        layoutThursdayCaptionLabel()
        layoutThursdayEventLabel()

        layoutFridayCaptionLabel()
        layoutFridayEventLabelOne()
        layoutFridaySeminarOneButton()
        layoutFridayEventLabelTwo()
        layoutFridaySeminarTwoButton()
        layoutFridayEventLabelThree()

        layoutSaturdayCaptionLabel()
        layoutSaturdayEventLabelOne()
        layoutSaturdaySeminarButton()
        layoutSaturdayEventLabelTwo()

        layoutSundayCaptionLabel()
        layoutSundayEventLabel()
        layoutSundayEveningEventButton()

        layoutMondayCaptionLabel()
        layoutMondayEventLabel()
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
            make.trailing.equalToSuperview()
        }

        fridaySeminarOneButton?.addTarget(self, action: #selector(didPressSeminarOneButton), for: .touchUpInside)
    }

    private func layoutFridayEventLabelTwo() {
        scrollView.addSubview(fridayEventLabelTwo)
        fridayEventLabelTwo.snp.makeConstraints { make in
            make.top.equalTo(fridaySeminarOneButton!.snp.bottomMargin).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }

    private func layoutFridaySeminarTwoButton() {
        scrollView.addSubview(fridaySeminarTwoButton!)
        fridaySeminarTwoButton?.snp.makeConstraints { make in
            make.top.equalTo(fridayEventLabelTwo.snp.bottomMargin).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview()
        }

        fridaySeminarTwoButton?.addTarget(self, action: #selector(didPressSeminarTwoButton), for: .touchUpInside)
    }

    private func layoutFridayEventLabelThree() {
        scrollView.addSubview(fridayEventLabelThree)
        fridayEventLabelThree.snp.makeConstraints { make in
            make.top.equalTo(fridaySeminarTwoButton!.snp.bottomMargin).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }

    private func layoutSaturdayCaptionLabel() {
        scrollView.addSubview(saturdayCaptionLabel)
        saturdayCaptionLabel.snp.makeConstraints { make in
            make.top.equalTo(fridayEventLabelThree.snp.bottomMargin).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }

    private func layoutSaturdayEventLabelOne() {
        scrollView.addSubview(saturdayEventOneLabel)
        saturdayEventOneLabel.snp.makeConstraints { make in
            make.top.equalTo(saturdayCaptionLabel.snp.bottomMargin).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }

    private func layoutSaturdaySeminarButton() {
        scrollView.addSubview(saturdaySeminarButton!)
        saturdaySeminarButton?.snp.makeConstraints { make in
            make.top.equalTo(saturdayEventOneLabel.snp.bottomMargin).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview()
        }

        saturdaySeminarButton?.addTarget(self, action: #selector(didPressSeminarThreeButton), for: .touchUpInside)
    }

    private func layoutSaturdayEventLabelTwo() {
        scrollView.addSubview(saturdayEventTwoLabel)
        saturdayEventTwoLabel.snp.makeConstraints { make in
            make.top.equalTo(saturdaySeminarButton!.snp.bottomMargin).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }

    private func layoutSundayCaptionLabel() {
        scrollView.addSubview(sundayCaptionLabel)
        sundayCaptionLabel.snp.makeConstraints { make in
            make.top.equalTo(saturdayEventTwoLabel.snp.bottomMargin).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }

    private func layoutSundayEventLabel() {
        scrollView.addSubview(sundayEventLabel)
        sundayEventLabel.snp.makeConstraints { make in
            make.top.equalTo(sundayCaptionLabel.snp.bottomMargin).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }

    private func layoutSundayEveningEventButton() {
        scrollView.addSubview(sundayEveningEventButton!)
        sundayEveningEventButton?.snp.makeConstraints { make in
            make.top.equalTo(sundayEventLabel.snp.bottomMargin).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }

        sundayEveningEventButton?.addTarget(self, action: #selector(didPressDeltaMapButton), for: .touchUpInside)
    }

    private func layoutMondayCaptionLabel() {
        scrollView.addSubview(mondayCaptionLabel)
        mondayCaptionLabel.snp.makeConstraints { make in
            make.top.equalTo(sundayEveningEventButton!.snp.bottomMargin).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }

    private func layoutMondayEventLabel() {
        scrollView.addSubview(mondayEventLabel)
        mondayEventLabel.snp.makeConstraints { make in
            make.top.equalTo(mondayCaptionLabel.snp.bottomMargin).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }

    @objc private func didPressSeminarOneButton() {
        fridaySeminarOneButton?.pulsate()

        let viewController = SeminarDetailViewController(seminar: seminars[0])!
        present(viewController, animated: true)
    }

    @objc private func didPressSeminarTwoButton() {
        fridaySeminarTwoButton?.pulsate()

        let viewController = SeminarDetailViewController(seminar: seminars[0])!
        present(viewController, animated: true)
    }

    @objc private func didPressSeminarThreeButton() {
        saturdaySeminarButton?.pulsate()

        let viewController = SeminarDetailViewController(seminar: seminars[0])!
        present(viewController, animated: true)
    }

    @objc private func didPressDeltaMapButton() {
        sundayEveningEventButton?.pulsate()

        let viewController = DeltaMapViewController()
        present(viewController, animated: true)
    }

    @objc private func didPressEdit() {
        let viewController = SeminarsEditViewController(delegate: self)!
        present(viewController, animated: true)
    }

    func updateData() {
        fridaySeminarOneButton?.titleText = Defaults.seminarOne
        fridaySeminarTwoButton?.titleText = Defaults.seminarTwo
        saturdaySeminarButton?.titleText = Defaults.seminarThree
    }
}