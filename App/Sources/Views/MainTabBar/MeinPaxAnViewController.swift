// Copyright © 2019 SWDEC. All rights reserved.

import SwiftyUserDefaults
import UIKit

class MeinPaxAnViewController: UIViewController {
    private lazy var helloLabel = TitleLabel(text: "Hallo, \(Defaults.username ?? "Error")")

    private lazy var userImageView: UIImageView = {
        let imageView = UIImageView(image: Images.userMale)
        imageView.tintColor = Colors.ecGreen
        return imageView
    }()

    private lazy var daysUntilPaXanLabel = SubtitleLabel(text: meinPaXanCaption)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        // Fixes the navigatiobar on iOS 13.
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [
                .foregroundColor: UIColor.white,
                .font: UIFont.title
            ]
            navBarAppearance.largeTitleTextAttributes = [
                .foregroundColor: UIColor.white,
                .font: UIFont.title
            ]
            navBarAppearance.backgroundColor = Colors.ecGreen
            super.navigationController?.navigationBar.standardAppearance = navBarAppearance
            super.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        }

        setupUserImageView()
        setupHelloLabel()
        setupDaysUntilPaXanLabel()
    }

    private func setupUserImageView() {
        view.addSubview(userImageView)
        userImageView.snp.makeConstraints { make in
            make.top.equalTo(super.view.snp.topMargin).offset(40)
            make.size.equalTo(70)
            make.centerX.equalToSuperview()
        }
    }

    private func setupHelloLabel() {
        view.addSubview(helloLabel)
        helloLabel.snp.makeConstraints { make in
            make.top.equalTo(userImageView.snp.bottomMargin)
            make.centerX.equalToSuperview()
        }
    }

    private func setupDaysUntilPaXanLabel() {
        view.addSubview(daysUntilPaXanLabel)
        daysUntilPaXanLabel.snp.makeConstraints { make in
            make.top.equalTo(helloLabel.snp.bottomMargin).offset(20)
            make.centerX.equalToSuperview()
        }
    }
}
