// Copyright © 2020 SWDEC. All rights reserved.

import UIKit

class BibleTextViewController: UIViewController {
    private lazy var bibleTextTitleLabel = TitleLabel(text: "")
    private lazy var bibleTextLabel = TextLabel(text: "")
    private lazy var copyrightLabel = TextLabel(text: "2011 © Genfer Bibelgesellschaft")

    private lazy var stackView = UIStackView(
        arrangedSubviews: [
            bibleTextLabel,
            copyrightLabel
        ]
    )

    private lazy var scrollView = UIScrollView()

    private lazy var doneButton = SetupButton(text: "Fertig")

    init(bibleTextTitle: String, bibleText: String) {
        super.init(nibName: nil, bundle: nil)

        bibleTextTitleLabel.text = bibleTextTitle
        bibleTextLabel.text = bibleText
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Colors.ecGreen

        setupDoneButton()

        view.addSubview(bibleTextTitleLabel)
        bibleTextTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.topMargin).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }

        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(bibleTextTitleLabel.snp.bottomMargin).offset(15)
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
