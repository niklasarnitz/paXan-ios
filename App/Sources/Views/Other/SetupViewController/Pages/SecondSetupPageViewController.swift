// Copyright © 2019 SWDEC. All rights reserved.

import SwiftyUserDefaults
import UIKit

/// Second Setup Page View Controller
class SecondSetupPageViewController: UIViewController {
    // MARK: Instance Properties
    private lazy var titleLabel = TitleLabel(text: config.secondPageTitle)

    private lazy var subTitleLabel = SubtitleLabel(text: config.secondPageSubtitle)

    private lazy var nameTextField: UITextField = {
        let textfield = UITextField()

        textfield.textColor = .white
        textfield.attributedPlaceholder = NSAttributedString(
            string: config.secondPageTextFieldPlaceholder,
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5)
            ]
        )
        textfield.textAlignment = .center
        textfield.layer.borderWidth = 1
        textfield.layer.cornerRadius = 5
        textfield.layer.borderColor = UIColor.white.cgColor

        textfield.textColor = .white

        return textfield
    }()

    private lazy var continueButton: UIButton = {
        let button = SetupButton()

        button.setTitle(config.setupContinueButtonTitle, for: .normal)

        button.alpha = 0.5

        return button
    }()

    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupTitleLabel()
        setupSubTitleLabel()
        setupNameTextField()
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

    private func setupNameTextField() {
        view.addSubview(nameTextField)

        nameTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(subTitleLabel.snp.bottomMargin).offset(20)
            make.leading.equalToSuperview().offset(26)
            make.trailing.equalToSuperview().offset(-26)
            make.height.equalTo(35)
        }

        nameTextField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
    }

    @objc func editingChanged(_ textField: UITextField) {
        if nameTextField.text!.isEmpty {
            continueButton.isEnabled = false
            continueButton.alpha = 0.5
        } else {
            continueButton.isEnabled = true
            continueButton.alpha = 1
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
        Defaults.username = nameTextField.text

        button.pulsate()

        let viewController = ThirdSetupPageViewController()
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .flipHorizontal
        present(viewController, animated: true)
    }
}
