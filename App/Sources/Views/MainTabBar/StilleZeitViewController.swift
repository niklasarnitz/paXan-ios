// Copyright © 2020 SWDEC. All rights reserved.

import UIKit

class StilleZeitViewController: UIViewController {
    private lazy var fridayBibleTextButton = ThemedButton(text: "Freitag")
    private lazy var saturdayBibleTextButton = ThemedButton(text: "Samstag")
    private lazy var sundayBibleTextButton = ThemedButton(text: "Sonntag")
    private lazy var mondayBibleTextButton = ThemedButton(text: "Montag")

    private lazy var stackView = UIStackView(
        arrangedSubviews: [
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

        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview()
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
    }

    @objc private func didPressFridayButton() {
        fridayBibleTextButton.pulsate()
    }
}
