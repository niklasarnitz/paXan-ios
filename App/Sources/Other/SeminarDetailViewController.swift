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
        return label
    }()

    private lazy var referentLabel: UILabel = {
        let label = UILabel()

        label.numberOfLines = 0

        return label
    }()

    private lazy var roomNameLabel: UILabel = {
        let label = UILabel()

        label.numberOfLines = 0

        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()

        label.numberOfLines = 0

        return label
    }()

    private lazy var navigateButton: SeminarButton = {
        let button = SeminarButton()

        button.titleText = "Navigieren"

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
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }

        setupTitleLabel()
        setupReferentLabel()
        setupRoomNameLabel()
        setupDescriptionLabel()
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

    private func setupNavigateButton() {
        view.addSubview(navigateButton)
        navigateButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }

        navigateButton.addTarget(self, action: #selector(navigateButtonPressed), for: .touchUpInside)
    }

    @objc
    private func navigateButtonPressed() {
        // TODO: Implement this
    }
}
