// Copyright © 2019 SWDEC. All rights reserved.

import MapKit
import UIKit

class SeminarDetailViewController: UIViewController {
    private var seminar: Seminar

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.2
        label.textColor = .white
        return label
    }()

    private lazy var referentLabel: UILabel = {
        let label = UILabel()

        label.textColor = .white
        label.numberOfLines = 0

        return label
    }()

    private lazy var roomNameLabel: UILabel = {
        let label = UILabel()

        label.textColor = .white
        label.numberOfLines = 0

        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()

        label.textColor = .white
        label.numberOfLines = 0

        return label
    }()

    private lazy var navigateButton: SeminarButton = {
        let button = SeminarButton()

        button.titleText = "Navigieren"

        return button
    }()

    private lazy var doneButton: SeminarButton = {
        let button = SeminarButton()

        button.titleText = "Fertig"

        return button
    }()

    init?(seminar: Seminar) {
        self.seminar = seminar
        super.init(nibName: nil, bundle: nil)

        self.titleLabel.text = seminar.title
        self.referentLabel.text = "Referent: " + (seminar.referent ?? "")
        self.roomNameLabel.text = "Raum: " + (seminar.place?.roomname ?? "")
        self.descriptionLabel.text = "Beschreibung: " + (seminar.description ?? "")
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 13.0, *) {
            view.backgroundColor = Colors.ecGreen
        } else {
            view.backgroundColor = Colors.ecGreen
        }

        setupTitleLabel()
        setupReferentLabel()
        setupRoomNameLabel()
        setupDescriptionLabel()
        setupDoneButton()
        setupNavigateButton()
    }

    private func setupTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }

    private func setupReferentLabel() {
        view.addSubview(referentLabel)
        referentLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottomMargin).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }

    private func setupRoomNameLabel() {
        view.addSubview(roomNameLabel)
        roomNameLabel.snp.makeConstraints { make in
            make.top.equalTo(referentLabel.snp.bottomMargin).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }

    private func setupDescriptionLabel() {
        view.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(roomNameLabel.snp.bottomMargin).offset(20)
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
            make.bottom.equalTo(doneButton.snp.topMargin).offset(-40)
            make.height.equalTo(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }

        navigateButton.addTarget(self, action: #selector(navigateButtonPressed), for: .touchUpInside)
    }

    @objc
    private func doneButtonPressed() {
        doneButton.pulsate()
        self.dismiss(animated: true)
    }

    @objc
    private func navigateButtonPressed() {
        navigateButton.pulsate()
        let regionDistance: CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(seminar.place!.annotation!.coordinate.latitude, seminar.place!.annotation!.coordinate.longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = seminar.place!.roomname
        mapItem.openInMaps(launchOptions: options)
    }
}
