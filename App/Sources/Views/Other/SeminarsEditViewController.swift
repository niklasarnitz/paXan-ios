// Copyright © 2019 SWDEC. All rights reserved.

import SwiftyUserDefaults
import UIKit

class SeminarsEditViewController: UIViewController {
    private weak var editorsDelegate: EditorsDelegate?

    private lazy var titleLabel = TitleLabel(text: "Seminare Bearbeiten")
    private lazy var subTitleLabel = SubtitleLabel(text: "Hier kannst du deine Seminare bearbeiten")
    private lazy var continueButton = SetupButton(text: "Fertig")
    private lazy var heimatlosTitleLabel = TitleLabel(text: "#heimatlos")
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
    private lazy var seminarOnePickerViewTextField = SeminarPickerTextField(
        placeholder: config.thirdPageTextFieldPlaceholderOne,
        pickerView: seminarOnePickerView
    )
    private lazy var seminarTwoPickerViewTextField = SeminarPickerTextField(
        placeholder: config.thirdPageTextFieldPlaceholderTwo,
        pickerView: seminarTwoPickerView
    )
    private lazy var heimwehTitleLabel = TitleLabel(text: "#heimweh")
    private lazy var seminarThreePickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        return pickerView
    }()
    private lazy var seminarThreePickerViewTextField = SeminarPickerTextField(
        placeholder: config.thirdPageTextFieldPlaceholderThree,
        pickerView: seminarThreePickerView
    )

    private lazy var verticalView = VerticalViewController(
        arrangedSubviews: [
            subTitleLabel,
            heimatlosTitleLabel,
            seminarOnePickerViewTextField,
            seminarTwoPickerViewTextField,
            heimwehTitleLabel,
            seminarThreePickerViewTextField
        ]
    )

    init?(delegate: EditorsDelegate?) {
        super.init(nibName: nil, bundle: nil)

        self.editorsDelegate = delegate
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Colors.ecGreen

        setupTitleLabel()
        setupContinueButton()

        view.addSubview(verticalView.view)
        verticalView.view.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottomMargin).offset(20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(continueButton.snp.topMargin).offset(-20)
        }

        seminarOnePickerViewTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        seminarTwoPickerViewTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        seminarThreePickerViewTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
    }

    private func setupTitleLabel() {
        view.addSubview(titleLabel)

        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(super.view.snp.topMargin).offset(50)
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

        continueButton.addTarget(self, action: #selector(didPressDone), for: .touchUpInside)
    }

    @objc func didPressDone(_ button: UIButton) {
        button.pulsate()

        editorsDelegate?.updateData()

        dismiss(animated: true)
    }
}

extension SeminarsEditViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == seminarOnePickerView {
            return Defaults.seminarsOne.count
        } else if pickerView == seminarTwoPickerView {
            return Defaults.seminarsTwo.count
        } else if pickerView == seminarThreePickerView {
            return Defaults.seminarsThree.count
        } else {
            return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == seminarOnePickerView {
            return Defaults.seminarsOne[row].title
        } else if pickerView == seminarTwoPickerView {
            return Defaults.seminarsTwo[row].title
        } else if pickerView == seminarThreePickerView {
            return Defaults.seminarsThree[row].title
        } else {
            return "Error"
        }
    }

    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == seminarOnePickerView {
            seminarOnePickerViewTextField.text = Defaults.seminarsOne[row].title
            Defaults.seminarOne = Defaults.seminarsOne[row]
         } else if pickerView == seminarTwoPickerView {
            seminarTwoPickerViewTextField.text = Defaults.seminarsTwo[row].title
            Defaults.seminarTwo = Defaults.seminarsTwo[row]
        } else if pickerView == seminarThreePickerView {
            seminarThreePickerViewTextField.text = Defaults.seminarsThree[row].title
            Defaults.seminarThree = Defaults.seminarsThree[row]
        }
    }
}
