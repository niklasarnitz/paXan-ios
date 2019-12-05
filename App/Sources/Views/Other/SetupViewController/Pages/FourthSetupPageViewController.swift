// Copyright © 2019 SWDEC. All rights reserved.

import SwiftyUserDefaults
import UIKit

/// Fourth Setup Page View Controller
class FourthSetupPageViewController: UIViewController {
    // MARK: Instance Properties
    private lazy var titleLabel = TitleLabel(text: finalPageTitle)!

    private lazy var subTitleLabel = SubtitleLabel(text: finalPageSubtitle)!

    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()

        imageView.image = Images.ecLogo
        imageView.tintColor = .white

        return imageView
    }()

    private lazy var continueButton = SetupButton(text: setupFinishButtonTitle)!

    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupTitleLabel()
        setupSubTitleLabel()
        setupLogoImageView()
        setupContinueButton()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)

        Defaults.didLaunchBefore = true
    }

    // MARK: UI Setup
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

    private func setupLogoImageView() {
        view.addSubview(logoImageView)

        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(subTitleLabel.snp.bottomMargin).offset(20)
            make.size.equalTo(50)
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

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController()
        viewController?.modalPresentationStyle = .fullScreen
        viewController?.modalTransitionStyle = .coverVertical
        present(viewController!, animated: true)
    }
}