// Copyright © 2019 SWDEC. All rights reserved.

import SwiftyUserDefaults
import UIKit

/// Third Setup Page View Controller
class ThirdSetupPageViewController: UIViewController {
    // MARK: Instance Properties
    private lazy var titleLabel = TitleLabel(text: thirdPageTitle)!

    private lazy var subTitleLabel = SubtitleLabel(text: thirdPageSubtitle)!

    private lazy var continueButton = SetupButton(text: setupContinueButtonTitle)!

    private lazy var heimatlosTitleLabel = TitleLabel(text: "#heimatlos")!

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

        textField.textColor = .white
        textField.attributedPlaceholder = NSAttributedString(
            string: thirdPageTextFieldPlaceholderOne,
            attributes: [ NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5) ]
        )
        textField.textAlignment = .center
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.white.cgColor
        textField.inputView = seminarOnePickerView
        textField.rightViewMode = .always
        textField.rightView = {
            let imageView = UIImageView(image: Images.upDownArrow)
            imageView.tintColor = .white
            return imageView
        }()

        return textField
    }()

    private lazy var seminarTwoPickerViewTextField: UITextField = {
        let textField = UITextField()

        textField.textColor = .white
        textField.attributedPlaceholder = NSAttributedString(
            string: thirdPageTextFieldPlaceholderTwo,
            attributes: [ NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5) ]
        )
        textField.textAlignment = .center
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.white.cgColor
        textField.inputView = seminarTwoPickerView
        textField.rightViewMode = .always
        textField.rightView = {
            let imageView = UIImageView(image: Images.upDownArrow)
            imageView.tintColor = .white
            return imageView
        }()

        return textField
    }()

    private lazy var heimwehTitleLabel = TitleLabel(text: "#heimweh")!

    private lazy var seminarThreePickerView: UIPickerView = {
        let pickerView = UIPickerView()

        pickerView.delegate = self

        return pickerView
    }()

    private lazy var seminarThreePickerViewTextField: UITextField = {
        let textField = UITextField()

        textField.textColor = .white
        textField.attributedPlaceholder = NSAttributedString(
            string: thirdPageTextFieldPlaceholderThree,
            attributes: [ NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5) ]
        )
        textField.textAlignment = .center
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.white.cgColor
        textField.inputView = seminarThreePickerView
        textField.rightViewMode = .always
        textField.rightView = {
            let imageView = UIImageView(image: Images.upDownArrow)
            imageView.tintColor = .white
            return imageView
        }()

        return textField
    }()

    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupTitleLabel()
        setupSubTitleLabel()
        setupHeimatlosTitleLabel()
        setupSeminarOnePickerViewTextField()
        setupSeminarTwoPickerViewTextField()
        setupHeimwehTitleLabel()
        setupSeminarThreePickerViewTextField()
        setupContinueButton()
    }

    // MARK: UI Setup
    private func setupView() {
        view.backgroundColor = Colors.ecGreen
    }

    private func setupTitleLabel() {
        view.addSubview(titleLabel)

        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(super.view.snp.topMargin).offset(50)
        }
    }

    private func setupSubTitleLabel() {
        view.addSubview(subTitleLabel)

        subTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottomMargin).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }

    private func setupHeimatlosTitleLabel() {
        view.addSubview(heimatlosTitleLabel)
        heimatlosTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(25)
            make.top.equalTo(subTitleLabel.snp.bottomMargin).offset(25)
        }
    }

    private func setupSeminarOnePickerViewTextField() {
        view.addSubview(seminarOnePickerViewTextField)

        seminarOnePickerViewTextField.snp.makeConstraints { make in
            make.top.equalTo(heimatlosTitleLabel.snp.bottomMargin).offset(25)
            make.height.equalTo(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }

    private func setupSeminarTwoPickerViewTextField() {
        view.addSubview(seminarTwoPickerViewTextField)

        seminarTwoPickerViewTextField.snp.makeConstraints { make in
            make.top.equalTo(seminarOnePickerViewTextField.snp.bottomMargin).offset(25)
            make.height.equalTo(40)
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
            make.top.equalTo(heimwehTitleLabel.snp.bottomMargin).offset(25)
            make.height.equalTo(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }

    private func setupContinueButton() {
        view.addSubview(continueButton)

        continueButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.bottom.equalToSuperview().offset(-50)
            make.leading.equalToSuperview().offset(26)
            make.trailing.equalToSuperview().offset(-26)
        }

        continueButton.addTarget(self, action: #selector(goToNextPage), for: .touchUpInside)
    }

    @objc func goToNextPage(_ button: UIButton) {
        button.pulsate()

        let viewController = FourthSetupPageViewController()
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .flipHorizontal
        present(viewController, animated: true)
    }
}

extension ThirdSetupPageViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == seminarOnePickerView {
            return seminars.count
        } else if pickerView == seminarTwoPickerView {
            return seminars.count
        } else if pickerView == seminarThreePickerView {
            return seminars.count
        } else {
            return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == seminarOnePickerView {
            return seminars[row].title
        } else if pickerView == seminarTwoPickerView {
            return seminars[row].title
        } else if pickerView == seminarThreePickerView {
            return seminars[row].title
        } else {
            return "Error"
        }
    }

    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == seminarOnePickerView {
            seminarOnePickerViewTextField.text = seminars[row].title
            Defaults.seminarOne = seminarOnePickerViewTextField.text ?? ""
        } else if pickerView == seminarTwoPickerView {
            seminarTwoPickerViewTextField.text = seminars[row].title
            Defaults.seminarTwo = seminarTwoPickerViewTextField.text ?? ""
        } else if pickerView == seminarThreePickerView {
            seminarThreePickerViewTextField.text = seminars[row].title
            Defaults.seminarThree = seminarThreePickerViewTextField.text ?? ""
        }
    }
}