// Copyright © 2020 SWDEC. All rights reserved.

import UIKit

class StilleZeitViewController: UIViewController {
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = config.stilleZeitDescription

        label.font = UIFont.eventBody
        label.numberOfLines = 0
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping

        label.textColor = Colors.ecGreen

        return label
    }()
    private lazy var fridayBibleTextButton = ThemedButton(text: "Freitag")
    private lazy var saturdayBibleTextButton = ThemedButton(text: "Samstag")
    private lazy var sundayBibleTextButton = ThemedButton(text: "Sonntag")
    private lazy var mondayBibleTextButton = ThemedButton(text: "Montag")

    private lazy var stackView = UIStackView(
        arrangedSubviews: [
            descriptionLabel,
            fridayBibleTextButton,
            saturdayBibleTextButton,
            sundayBibleTextButton,
            mondayBibleTextButton
        ]
    )

    private lazy var scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        fixNavigationBar()

        descriptionLabel.textColor = .black

        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(super.view.snp.topMargin).offset(20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
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

        fridayBibleTextButton.addTarget(self, action: #selector(didPressFridayButton), for: .touchUpInside)
        saturdayBibleTextButton.addTarget(self, action: #selector(didPressSaturdayButton), for: .touchUpInside)
        sundayBibleTextButton.addTarget(self, action: #selector(didPressSundayButton), for: .touchUpInside)
        mondayBibleTextButton.addTarget(self, action: #selector(didPressMondayButton), for: .touchUpInside)
    }

    @objc private func didPressFridayButton() {
        fridayBibleTextButton.pulsate()

        let viewController = BibleTextViewController(
            bibleTextTitle: config.fridayBibleTextTitle,
            bibleText: config.fridayBibleText
        )

        present(viewController, animated: true)
    }

    @objc private func didPressSaturdayButton() {
        saturdayBibleTextButton.pulsate()

        let viewController = BibleTextViewController(
            bibleTextTitle: config.saturdayBibleTextTitle,
            bibleText: config.saturdayBibleText
        )

        present(viewController, animated: true)
    }

    @objc private func didPressSundayButton() {
        sundayBibleTextButton.pulsate()

        let viewController = BibleTextViewController(
            bibleTextTitle: config.sundayBibleTextTitle,
            bibleText: config.sundayBibleText
        )

        present(viewController, animated: true)
    }

    @objc private func didPressMondayButton() {
        mondayBibleTextButton.pulsate()

        let viewController = BibleTextViewController(
            bibleTextTitle: config.mondayBibleTextTitle,
            bibleText: config.mondayBibleText
        )

        present(viewController, animated: true)
    }
}
