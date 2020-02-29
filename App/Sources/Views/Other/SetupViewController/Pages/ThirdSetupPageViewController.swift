// Copyright © 2019 SWDEC. All rights reserved.

import SwiftyUserDefaults
import UIKit

/// Third Setup Page View Controller
class ThirdSetupPageViewController: UIViewController {
    // MARK: Instance Properties
    private lazy var titleLabel = TitleLabel(text: config.thirdPageTitle)

    private lazy var subTitleLabel = SubtitleLabel(text: config.thirdPageSubtitle)

    private lazy var continueButton = SetupButton(text: config.setupContinueButtonTitle)

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

    private lazy var stackView = UIStackView(
        arrangedSubviews: [
            heimatlosTitleLabel,
            seminarOnePickerViewTextField,
            seminarTwoPickerViewTextField,
            heimwehTitleLabel,
            seminarThreePickerViewTextField
        ]
    )

    private lazy var scrollView = UIScrollView()

    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Colors.ecGreen

        _ = DataManager()

        setupContinueButton()

        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(40)
        }

        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottomMargin).offset(15)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(continueButton.snp.topMargin).offset(-15)
        }

        scrollView.addSubview(stackView)
        stackView.bindEdgesToSuperview()
        stackView.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }

        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 15

        seminarOnePickerViewTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
        }

        seminarTwoPickerViewTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
        }

        seminarThreePickerViewTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
        }

        stackView.arrangedSubviews.forEach { view in
            view.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(20)
                make.trailing.equalToSuperview().offset(-20)
            }
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
