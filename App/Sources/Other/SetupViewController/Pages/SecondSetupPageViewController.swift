// Copyright © 2019 SWDEC. All rights reserved.

import UIKit

class SecondSetupPageViewController: UIViewController {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()

        label.text = secondPageTitle
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.textColor = .white
        label.numberOfLines = 0

        return label
    }()

    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = secondPageSubtitle

        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping

        return label
    }()

    private lazy var nameTextField: UITextField = {
        let textField = UITextField()

        textField.textColor = .white
        textField.attributedPlaceholder = NSAttributedString(
            string: secondPageTextFieldPlaceholder,
            attributes: [ NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5) ]
        )
        textField.textAlignment = .center
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.white.cgColor
        textField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)

        return textField
    }()

    private lazy var continueButton: UIButton = {
        let button = UIButton()

        button.setTitle(setupContinueButtonTitle, for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.white.cgColor
        button.isEnabled = false

        return button
    }()

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
    }

    @objc func editingChanged(_ textField: UITextField) {
        if nameTextField.text!.isEmpty {
            continueButton.isEnabled = false
        } else {
            continueButton.isEnabled = true
        }
    }

    private func setupContinueButton() {
        view.addSubview(continueButton)

        continueButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.bottom.equalToSuperview().offset(-45)
            make.leading.equalToSuperview().offset(26)
            make.trailing.equalToSuperview().offset(-26)
        }

        continueButton.addTarget(self, action: #selector(goToNextPage), for: .touchUpInside)
    }

    @objc func goToNextPage(_ button: UIButton) {
        let viewController = ThirdSetupPageViewController()
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .flipHorizontal
        present(viewController, animated: true)
    }
}
