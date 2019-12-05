// Copyright © 2019 SWDEC. All rights reserved.

import SwiftyUserDefaults
import UIKit

class EditViewController: UIViewController {
    private lazy var titleLabel = TitleLabel(text: "Seminare Bearbeiten")!

    private lazy var subTitleLabel = SubtitleLabel(text: "Hier kannst du deine Seminare bearbeiten")!

    private lazy var continueButton = SetupButton(text: "Fertig")!

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

    private lazy var seminarTwoPickerViewTextField = SeminarPickerViewTextField(
        placeholder: thirdPageTextFieldPlaceholderTwo,
        pickerView: seminarTwoPickerView
    )!

    private lazy var heimwehTitleLabel = TitleLabel(text: "#heimweh")!

    private lazy var seminarThreePickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        return pickerView
    }()

    private lazy var seminarThreePickerViewTextField = SeminarPickerViewTextField(
        placeholder: thirdPageTextFieldPlaceholderThree,
        pickerView: seminarThreePickerView
    )!

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

        dismiss(animated: true)
    }
}

extension EditViewController: UIPickerViewDataSource, UIPickerViewDelegate {
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
            return seminarBlockOneSeminars[row].title
        } else if pickerView == seminarTwoPickerView {
            return seminarBlockTwoSeminars[row].title
        } else if pickerView == seminarThreePickerView {
            return seminarBlockThreeSeminars[row].title
        } else {
            return "Error"
        }
    }

    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == seminarOnePickerView {
            seminarOnePickerViewTextField.text = seminarBlockOneSeminars[row].title
            Defaults.seminarOne = seminarOnePickerViewTextField.text ?? ""
         } else if pickerView == seminarTwoPickerView {
            seminarTwoPickerViewTextField.text = seminarBlockTwoSeminars[row].title
            Defaults.seminarTwo = seminarTwoPickerViewTextField.text ?? ""
        } else if pickerView == seminarThreePickerView {
            seminarThreePickerViewTextField.text = seminarBlockThreeSeminars[row].title
            Defaults.seminarThree = seminarThreePickerViewTextField.text ?? ""
        }
    }
}
