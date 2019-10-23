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

    private lazy var seminarOnePickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        return pickerView
    }()

    private lazy var seminarTwoPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        return pickerView
    }()

    private lazy var seminarOnePickerViewTextField: UITextField = {
        let textField = UITextField()

        textField.text = Defaults.seminarOne
        textField.textColor = .black
        textField.attributedPlaceholder = NSAttributedString(
            string: secondPageTextFieldPlaceholder,
            attributes: [ NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.5) ]
        )
        textField.textAlignment = .center
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = Colors.ecGreen.cgColor
        textField.inputView = seminarOnePickerView

        return textField
    }()

    private lazy var seminarTwoPickerViewTextField: UITextField = {
        let textField = UITextField()

        textField.text = Defaults.seminarTwo
        textField.textColor = .black
        textField.attributedPlaceholder = NSAttributedString(
            string: secondPageTextFieldPlaceholder,
            attributes: [ NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.5) ]
        )
        textField.textAlignment = .center
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = Colors.ecGreen.cgColor
        textField.inputView = seminarTwoPickerView

        return textField
    }()

    private lazy var heimwehTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "#heimweh"
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.textColor = Colors.ecGreen
        return label
    }()

    private lazy var seminarThreePickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        return pickerView
    }()

    private lazy var seminarThreePickerViewTextField: UITextField = {
        let textField = UITextField()

        textField.text = Defaults.seminarThree
        textField.textColor = .black
        textField.attributedPlaceholder = NSAttributedString(
            string: secondPageTextFieldPlaceholder,
            attributes: [ NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.5) ]
        )
        textField.textAlignment = .center
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = Colors.ecGreen.cgColor
        textField.inputView = seminarThreePickerView

        return textField
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
        setupSeminarOnePickerViewTextField()
        setupSeminarTwoPickerViewTextField()
        setupHeimwehTitleLabel()
        setupSeminarThreePickerViewTextField()
    }

    private func setupHeimatlosTitleLabel() {
        view.addSubview(heimatlosTitleLabel)
        heimatlosTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(25)
            make.top.equalTo(super.view.snp.topMargin).offset(25)
        }
    }

    private func setupSeminarOnePickerViewTextField() {
        view.addSubview(seminarOnePickerViewTextField)

        seminarOnePickerViewTextField.snp.makeConstraints { make in
            make.top.equalTo(heimatlosTitleLabel.snp.bottomMargin).offset(20)
            make.height.equalTo(30)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }

    private func setupSeminarTwoPickerViewTextField() {
        view.addSubview(seminarTwoPickerViewTextField)

        seminarTwoPickerViewTextField.snp.makeConstraints { make in
            make.top.equalTo(seminarOnePickerViewTextField.snp.bottomMargin).offset(20)
            make.height.equalTo(30)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }

    private func setupHeimwehTitleLabel() {
        view.addSubview(heimwehTitleLabel)
        heimwehTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(25)
            make.top.equalTo(seminarTwoPickerViewTextField.snp.bottomMargin).offset(25)
        }
    }

    private func setupSeminarThreePickerViewTextField() {
        view.addSubview(seminarThreePickerViewTextField)

        seminarThreePickerViewTextField.snp.makeConstraints { make in
            make.top.equalTo(heimwehTitleLabel.snp.bottomMargin).offset(20)
            make.height.equalTo(30)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
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

extension SeminarPlanViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == seminarOnePickerView {
            return seminarBlockOneSeminars.count
        } else if pickerView == seminarTwoPickerView {
            return seminarBlockTwoSeminars.count
        } else if pickerView == seminarThreePickerView {
            return seminarBlockThreeSeminars.count
        } else {
            return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == seminarOnePickerView {
            return seminarBlockOneSeminars[row]?.title
        } else if pickerView == seminarTwoPickerView {
            return seminarBlockTwoSeminars[row]?.title
        } else if pickerView == seminarThreePickerView {
            return seminarBlockThreeSeminars[row]?.title
        } else {
            return "Error"
        }
    }

    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == seminarOnePickerView {
            seminarOnePickerViewTextField.text = seminarBlockOneSeminars[row]?.title
            Defaults.seminarOne = seminarOnePickerViewTextField.text ?? ""
        } else if pickerView == seminarTwoPickerView {
            seminarTwoPickerViewTextField.text = seminarBlockTwoSeminars[row]?.title
            Defaults.seminarTwo = seminarTwoPickerViewTextField.text ?? ""
        } else if pickerView == seminarThreePickerView {
            seminarThreePickerViewTextField.text = seminarBlockThreeSeminars[row]?.title
            Defaults.seminarThree = seminarThreePickerViewTextField.text ?? ""
        }
    }
}
