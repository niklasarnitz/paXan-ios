// Copyright © 2019 SWDEC. All rights reserved.

import MapKit
import UIKit

class MassQuarterViewController: UIViewController {
    private lazy var titleLabel = TitleLabel(text: "Massenquartiere")
    private lazy var descriptionLabel = SubtitleLabel(text: "Tippe auf den jeweiligen Namen, um zu deinem Massenquartier navigiert zu werden!")
    private lazy var dobeltalschuleButton = ThemedButton(text: "JUNGS | Dobeltalschule Bad Herrenalb")
    private lazy var bronnenwiesenhalleButton = ThemedButton(text: "MÄDELS | Bronnenwiesenhalle")
    private lazy var kindergartendobelButton = ThemedButton(text: "MÄDELS | Kindergarten Dobel")
    private lazy var schuledobelButton = ThemedButton(text: "MÄDELS | Schule Dobel")

    private lazy var verticalView = VerticalViewController(
        arrangedSubviews: [
            descriptionLabel,
            dobeltalschuleButton,
            bronnenwiesenhalleButton,
            kindergartendobelButton,
            schuledobelButton
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

        dobeltalschuleButton.addTarget(self, action: #selector(navigateToDobeltalschule), for: .touchUpInside)
        bronnenwiesenhalleButton.addTarget(self, action: #selector(navigateToBronnenwiesenhalle), for: .touchUpInside)
        kindergartendobelButton.addTarget(self, action: #selector(navigateToKindergartenDobel), for: .touchUpInside)
        schuledobelButton.addTarget(self, action: #selector(navigateToSchuleDobel), for: .touchUpInside)
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

    @objc private func navigateToDobeltalschule() {
        dobeltalschuleButton.pulsate()
        let regionDistance: CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(48.805071, 8.449980)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "JUNGS | Dobeltalschule"
        mapItem.openInMaps(launchOptions: options)
    }

    @objc private func navigateToBronnenwiesenhalle() {
        dobeltalschuleButton.pulsate()
        let regionDistance: CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(48.816815, 8.481872)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "MÄDELS | Bronnenwiesenhalle"
        mapItem.openInMaps(launchOptions: options)
    }

    @objc private func navigateToKindergartenDobel() {
        dobeltalschuleButton.pulsate()
        let regionDistance: CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(48.796287, 8.492539)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "MÄDELS | Kindergarten Dobel"
        mapItem.openInMaps(launchOptions: options)
    }

    @objc private func navigateToSchuleDobel() {
        dobeltalschuleButton.pulsate()
        let regionDistance: CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(48.797579, 8.494003)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "MÄDELS | Schule Dobel"
        mapItem.openInMaps(launchOptions: options)
    }

    @objc private func doneButtonPressed() {
        doneButton.pulsate()

        dismiss(animated: true)
    }
}
