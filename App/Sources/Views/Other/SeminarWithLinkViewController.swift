// Copyright © 2019 SWDEC. All rights reserved.

import MapKit
import UIKit

class SeminarWithLinkViewController: UIViewController {
    private var seminar: Seminar
    private var url: URL

    private lazy var titleLabel = TitleLabel(text: "")
    private lazy var subtitleLabel = SubtitleLabel(text: "")
    private lazy var referentLabel = TextLabel(text: "")
    private lazy var roomNameLabel = TextLabel(text: "")
    private lazy var linkButton = ThemedButton(text: "Link öffnen")
    private lazy var navigateButton = ThemedButton(text: "Navigieren")
    private lazy var doneButton = ThemedButton(text: "Fertig")
    private lazy var verticalView = VerticalViewController(
        arrangedSubviews: [
            subtitleLabel,
            referentLabel,
            roomNameLabel
        ]
    )

    init?(seminar: Seminar, url: String) {
        self.seminar = seminar
        self.url = URL(string: url) ?? URL(string: "about:blank")!
        super.init(nibName: nil, bundle: nil)

        self.titleLabel.text = seminar.title
        self.subtitleLabel.text = seminar.subtitle
        self.referentLabel.text = "Referent:\n" + (seminar.referent)
        self.roomNameLabel.text = "Raum: " + (seminar.roomname)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Colors.ecGreen

        setupTitleLabel()
        setupDoneButton()
        setupNavigateButton()
        setupOpenLinkButton()

        view.addSubview(verticalView.view)
        verticalView.view.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottomMargin).offset(20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(doneButton.snp.topMargin).offset(-20)
        }
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
            make.height.equalTo(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }

        doneButton.addTarget(self, action: #selector(doneButtonPressed), for: .touchUpInside)
    }

    private func setupNavigateButton() {
        view.addSubview(navigateButton)
        navigateButton.snp.makeConstraints { make in
            make.bottom.equalTo(doneButton.snp.topMargin).offset(-30)
            make.height.equalTo(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }

        navigateButton.addTarget(self, action: #selector(navigateButtonPressed), for: .touchUpInside)
    }

    private func setupOpenLinkButton() {
        view.addSubview(linkButton)
        linkButton.snp.makeConstraints { make in
            make.bottom.equalTo(navigateButton.snp.topMargin).offset(-30)
            make.height.equalTo(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        linkButton.addTarget(self, action: #selector(didPressLinkButton), for: .touchUpInside)
    }

    @objc private func doneButtonPressed() {
        doneButton.pulsate()

        self.dismiss(animated: true)
    }

    @objc private func navigateButtonPressed() {
        navigateButton.pulsate()
        let regionDistance: CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(seminar.lat, seminar.long)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = seminar.roomname
        mapItem.openInMaps(launchOptions: options)
    }

    @objc private func didPressLinkButton() {
        linkButton.pulsate()

        UIApplication.shared.open(self.url)
    }
}
