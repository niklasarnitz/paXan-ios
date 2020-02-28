// swiflint:disable line_length
// Copyright © 2019 SWDEC. All rights reserved.

import UIKit

/// First Setup Page View Controller
class FirstSetupPageViewController: UIViewController {
    // MARK: Instance Properties
    private lazy var titleLabel = TitleLabel(text: config.firstPageTitle)

    private lazy var subTitleLabel = SubtitleLabel(text: config.firstPageSubtitle)

    private lazy var descriptionLabelOne = SubtitleLabel(
        text: "Wir freuen uns, dass du mit dabei bist.\nGemeinsam wollen wir uns auf paX an von Gottes Plan mit uns Menschen begeistern lassen."
    )
    private lazy var descriptionLabelTwo = SubtitleLabel(
        text: "Sei gespannt, was dich an den einzelnen Tagen erwartet.\n\nAlle wichtigen Infos zu paX an haben wir in unserer paX-an-App zusammen gestellt.\nJede Menge Platz für deine persönlichen Notizen findest Du in deinem Notizheft.\nDein Armin und das paX-an-Team"
    )

    private lazy var stackView = UIStackView(
        arrangedSubviews: [
            subTitleLabel,
            descriptionLabelOne,
            descriptionLabelTwo
        ]
    )

    private lazy var scrollView = UIScrollView()

    private lazy var continueButton = SetupButton(text: config.setupContinueButtonTitle)

    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        DataManager()

        titleLabel.textAlignment = .center

        view.backgroundColor = Colors.ecGreen

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

        stackView.arrangedSubviews.forEach { view in
            view.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(20)
                make.trailing.equalToSuperview().offset(-20)
            }
        }
    }

    // MARK: Button Actions
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

        let viewController = ThirdSetupPageViewController()
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .flipHorizontal
        present(viewController, animated: true)
    }
}
