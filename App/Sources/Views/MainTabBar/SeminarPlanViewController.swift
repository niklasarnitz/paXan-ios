// swiftlint:disable trailing_closure
// Copyright © 2019 SWDEC. All rights reserved.

import MapKit
import SwiftyUserDefaults
import UIKit

class SeminarPlanViewController: UIViewController, EditorsDelegate {
    private lazy var heimatlosTitleLabel: UILabel = {
        let label = UILabel()

        label.text = "#heimatlos"
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.textColor = Colors.ecGreen
        label.textAlignment = .center
        label.contentMode = .center

        return label
    }()

    private lazy var seminarOneCaptionLabel: UILabel = {
        let label = UILabel()

        label.text = "Seminar I"
        label.font = .preferredFont(forTextStyle: .body)
        label.textAlignment = .center
        label.contentMode = .center

        return label
    }()

    private lazy var seminarOneButton: SeminarButton = {
        let button = SeminarButton()

        button.titleText = Defaults.seminarOne
        button.titleLabel?.font = .preferredFont(forTextStyle: .caption1)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.contentMode = .center

        return button
    }()

    private lazy var seminarTwoCaptionLabel: UILabel = {
        let label = UILabel()

        label.text = "Seminar II"
        label.font = .preferredFont(forTextStyle: .body)
        label.textAlignment = .center
        label.contentMode = .center

        return label
    }()

    private lazy var seminarTwoButton: SeminarButton = {
        let button = SeminarButton()

        button.titleText = Defaults.seminarTwo
        button.titleLabel?.font = .preferredFont(forTextStyle: .caption1)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.contentMode = .center

        return button
    }()

    private lazy var heimwehTitleLabel: UILabel = {
        let label = UILabel()

        label.text = "#heimweh"
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.textAlignment = .center
        label.contentMode = .center
        label.textColor = Colors.ecGreen

        return label
    }()

    private lazy var seminarThreeCaptionLabel: UILabel = {
        let label = UILabel()

        label.text = "Seminar III"
        label.font = .preferredFont(forTextStyle: .body)
        label.textAlignment = .center
        label.contentMode = .center

        return label
    }()

    private lazy var seminarThreeButton: SeminarButton = {
        let button = SeminarButton()

        button.titleText = Defaults.seminarThree
        button.titleLabel?.font = .preferredFont(forTextStyle: .caption1)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.contentMode = .center

        return button
    }()

    private lazy var editButton: SeminarButton = {
        let button = SeminarButton()

        button.titleText = "Bearbeiten"

        button.isEnabled = true

        return button
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
        setupSeminarOneButton()
        setupSeminarTwoCaptionLabel()
        setupSeminarTwoButton()
        setupHeimwehTitleLabel()
        setupSeminarThreeCaptionLabel()
        setupSeminarThreeButton()
        setupEditButton()
    }

    private func setupHeimatlosTitleLabel() {
        view.addSubview(heimatlosTitleLabel)
        heimatlosTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)
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

    private func setupSeminarOneButton() {
        view.addSubview(seminarOneButton)

        seminarOneButton.snp.makeConstraints { make in
            make.top.equalTo(seminarOneCaptionLabel.snp.bottomMargin).offset(20)
            make.height.equalTo(40)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)
        }

        seminarOneButton.addTarget(self, action: #selector(seminarOneButtonPressed), for: .touchUpInside)
    }

    private func setupSeminarTwoCaptionLabel() {
        view.addSubview(seminarTwoCaptionLabel)

        seminarTwoCaptionLabel.snp.makeConstraints { make in
            make.top.equalTo(seminarOneButton.snp.bottomMargin).offset(20)
            make.height.equalTo(30)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)
        }
    }

    private func setupSeminarTwoButton() {
        view.addSubview(seminarTwoButton)

        seminarTwoButton.snp.makeConstraints { make in
            make.top.equalTo(seminarTwoCaptionLabel.snp.bottomMargin).offset(20)
            make.height.equalTo(40)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)
        }

        seminarTwoButton.addTarget(self, action: #selector(seminarTwoButtonPressed), for: .touchUpInside)
    }

    private func setupHeimwehTitleLabel() {
        view.addSubview(heimwehTitleLabel)
        heimwehTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)
            make.top.equalTo(seminarTwoButton.snp.bottomMargin).offset(25)
        }
    }

    private func setupSeminarThreeCaptionLabel() {
        view.addSubview(seminarThreeCaptionLabel)

        seminarThreeCaptionLabel.snp.makeConstraints { make in
            make.top.equalTo(heimwehTitleLabel.snp.bottomMargin).offset(20)
            make.height.equalTo(40)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)
        }
    }

    private func setupSeminarThreeButton() {
        view.addSubview(seminarThreeButton)

        seminarThreeButton.snp.makeConstraints { make in
            make.top.equalTo(seminarThreeCaptionLabel.snp.bottomMargin).offset(20)
            make.height.equalTo(40)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)
        }

        seminarThreeButton.addTarget(self, action: #selector(seminarThreeButtonPressed), for: .touchUpInside)
    }

    private func setupEditButton() {
        view.addSubview(editButton)

        editButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.bottom.equalTo(super.view.snp.bottomMargin).offset(-50)
            make.leading.equalToSuperview().offset(26)
            make.trailing.equalToSuperview().offset(-26)
        }

        editButton.addTarget(self, action: #selector(editButtonPressed), for: .touchUpInside)
    }

    @objc func editButtonPressed(_ button: UIButton) {
        button.pulsate()

        let viewController = SeminarsEditViewController(delegate: self)
        present(viewController!, animated: true)
    }

    @objc func seminarOneButtonPressed(_ button: UIButton) {
        button.pulsate()

        let viewController = SeminarDetailViewController(
            seminar: seminars.first(
                where: {
                    $0.title == Defaults.seminarOne
                }
            )!
        )!
        present(viewController, animated: true)
    }

    @objc func seminarTwoButtonPressed(_ button: UIButton) {
        button.pulsate()

        let viewController = SeminarDetailViewController(
            seminar: seminars.first(
                where: {
                    $0.title == Defaults.seminarTwo
                }
            )!
        )!
        present(viewController, animated: true)
    }

    @objc func seminarThreeButtonPressed(_ button: UIButton) {
        button.pulsate()

        let viewController = SeminarDetailViewController(
            seminar: seminars.first(
                where: {
                    $0.title == Defaults.seminarThree
                }
            )!
        )!
        present(viewController, animated: true)
    }

    func updateData() {
        seminarOneButton.setTitle(Defaults.seminarOne, for: .normal)
        seminarTwoButton.setTitle(Defaults.seminarTwo, for: .normal)
        seminarThreeButton.setTitle(Defaults.seminarThree, for: .normal)
    }
}
