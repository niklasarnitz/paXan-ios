// swiftlint:disable file_header too_much_indentation
// Copyright © 2019 SWDEC. All rights reserved.

import MapKit
import UIKit

class SeminarPlanViewController: UIViewController {
    private lazy var heimatkundeTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "#heimatkunde"
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.textColor = Colors.ecGreen
        return label
    }()

    private lazy var heimatlosTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "#heimatlos"
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.textColor = Colors.ecGreen
        return label
    }()

    private lazy var heimwehTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "#heimweh"
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.textColor = Colors.ecGreen
        return label
    }()

    private lazy var heimwegTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "#heimweg"
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.textColor = Colors.ecGreen
        return label
    }()

    private lazy var heimatgeberTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "#heimatgeber"
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.textColor = Colors.ecGreen
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

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

        setupHeimatKundeTitleLabel()
        setupHeimatlosTitleLabel()
        setupHeimwehTitleLabel()
        setupHeimwegTitleLabel()
        setupHeimatgeberTitleLabel()
    }

    private func setupHeimatKundeTitleLabel() {
        view.addSubview(heimatkundeTitleLabel)
        heimatkundeTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(25)
            make.top.equalTo(super.view.snp.topMargin).offset(25)
        }
    }
    private func setupHeimatlosTitleLabel() {
        view.addSubview(heimatlosTitleLabel)
        heimatlosTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(25)
            make.top.equalTo(heimatkundeTitleLabel.snp.bottomMargin).offset(25)
        }
    }
    private func setupHeimwehTitleLabel() {
        view.addSubview(heimwehTitleLabel)
        heimwehTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(25)
            make.top.equalTo(heimatlosTitleLabel.snp.bottomMargin).offset(25)
        }
    }
    private func setupHeimwegTitleLabel() {
        view.addSubview(heimwegTitleLabel)
        heimwegTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(25)
            make.top.equalTo(heimwehTitleLabel.snp.bottomMargin).offset(25)
        }
    }
    private func setupHeimatgeberTitleLabel() {
        view.addSubview(heimatgeberTitleLabel)
        heimatgeberTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(25)
            make.top.equalTo(heimatgeberTitleLabel.snp.bottomMargin).offset(25)
        }
    }

    private func showMap(_ seminar: Seminar) {
        let mapView = MKMapView()
        mapView.addAnnotation({
                let annotation = MKPointAnnotation()
                annotation.title = seminar.title
                annotation.subtitle = seminar.description
                annotation.coordinate = seminar.location
                return annotation
            }()
        )
        let viewCtrl = UIViewController()
        viewCtrl.view.addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        present(InteractiveSheetViewController(containing: viewCtrl), animated: true)
    }
}
