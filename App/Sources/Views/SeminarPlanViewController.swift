// Copyright © 2019 SWDEC. All rights reserved.

import MapKit
import SwiftyUserDefaults
import UIKit

class SeminarPlanViewController: UIViewController {
    private lazy var heimatlosTitleLabel: UILabel = {
        let label = UILabel()

        label.text = "#heimatlos"
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.textColor = Colors.ecGreen

        return label
    }()

    private lazy var seminarOneCaptionLabel: UILabel = {
        let label = UILabel()

        label.text = "Seminar I"

        return label
    }()

    private lazy var seminarOneLabel: UILabel = {
        let label = UILabel()

        return label
    }()

    private lazy var seminarTwoCaptionLabel: UILabel = {
        let label = UILabel()

        label.text = "Seminar II"

        return label
    }()

    private lazy var heimwehTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "#heimweh"
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.textColor = Colors.ecGreen
        return label
    }()

    private lazy var seminarThreeCaptionLabel: UILabel = {
        let label = UILabel()

        label.text = "Seminar III"

        return label
    }()

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
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.backgroundColor = Colors.ecGreen
            super.navigationController?.navigationBar.standardAppearance = navBarAppearance
            super.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        }

        setupHeimatlosTitleLabel()
        setupSeminarOneCaptionLabel()
        setupSeminarTwoCaptionLabel()
        setupHeimwehTitleLabel()
        setupSeminarThreeCaptionLabel()
    }

    private func setupHeimatlosTitleLabel() {
        view.addSubview(heimatlosTitleLabel)
        heimatlosTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(25)
            make.top.equalTo(super.view.snp.topMargin).offset(25)
        }
    }

    private func setupSeminarOneCaptionLabel() {
        view.addSubview(seminarOneCaptionLabel)

        seminarOneCaptionLabel.snp.makeConstraints { make in
            make.top.equalTo(heimatlosTitleLabel.snp.bottomMargin).offset(20)
            make.height.equalTo(20)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)
        }
    }

    private func setupSeminarTwoCaptionLabel() {
        view.addSubview(seminarTwoCaptionLabel)

        seminarTwoCaptionLabel.snp.makeConstraints { make in
            make.top.equalTo(seminarOneCaptionLabel.snp.bottomMargin).offset(20)
            make.height.equalTo(20)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)
        }
    }

    private func setupHeimwehTitleLabel() {
        view.addSubview(heimwehTitleLabel)
        heimwehTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(25)
            make.top.equalTo(seminarTwoCaptionLabel.snp.bottomMargin).offset(25)
        }
    }

    private func setupSeminarThreeCaptionLabel() {
        view.addSubview(seminarThreeCaptionLabel)

        seminarThreeCaptionLabel.snp.makeConstraints { make in
            make.top.equalTo(heimwehTitleLabel.snp.bottomMargin).offset(20)
            make.height.equalTo(20)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)
        }
    }

    private func showMap(_ seminar: Seminar) {
        let mapView = MKMapView()
        let seminarAnnotation = MKPointAnnotation()
        seminarAnnotation.title = seminar.title
        seminarAnnotation.subtitle = seminar.description
        seminarAnnotation.coordinate = seminar.location

        mapView.addAnnotation(seminarAnnotation)

        let viewController = UIViewController()

        viewController.view.addSubview(mapView)

        mapView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        present(viewController, animated: true)
    }
}
