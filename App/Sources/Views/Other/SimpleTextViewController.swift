// Copyright © 2020 SWDEC. All rights reserved.

import UIKit

class SimpleTextViewController: UIViewController {
    private lazy var titleLabel = TitleLabel(text: "")
    private lazy var descriptionLabel = SubtitleLabel(text: "")

    private lazy var stackView = UIStackView(
        arrangedSubviews: [
            descriptionLabel
        ]
    )

    private lazy var scrollView = UIScrollView()

    private lazy var doneButton = SetupButton(text: "Fertig")

    init(title: String, text: String) {
        super.init(nibName: nil, bundle: nil)

        titleLabel.text = title
        descriptionLabel.text = text
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Colors.ecGreen

        setupTitleLabel()
        setupDoneButton()

        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottomMargin).offset(15)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(doneButton.snp.topMargin).offset(-15)
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

        stackView.arrangedSubviews.forEach { view in
            view.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(20)
                make.trailing.equalToSuperview().offset(-20)
            }
        }
    }

    private func setupTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }

    private func setupDoneButton() {
        view.addSubview(doneButton)
        doneButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }

        doneButton.addTarget(self, action: #selector(doneButtonPressed), for: .touchUpInside)
    }

    @objc private func doneButtonPressed() {
        doneButton.pulsate()

        dismiss(animated: true)
    }
}
