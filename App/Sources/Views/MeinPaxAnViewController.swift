// Copyright © 2019 SWDEC. All rights reserved.

import UIKit

class MeinPaxAnViewController: UIViewController {
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()

    private lazy var helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Hallo, Niklas!"
        label.textColor = .black
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        return label
    }()

    private lazy var userImageView: UIImageView = {
        let imageView = UIImageView(image: Images.userMale)
        imageView.tintColor = Colors.ecGreen
        return imageView
    }()

    private lazy var daysUntilPaXanLabel: UILabel = {
        let label = UILabel()
        label.text = "paXan startet bald!\nDann kannst du\ndie App benutzen."
        label.numberOfLines = 3
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        // TODO: Fix the navigatiobar on iOS 13. This is only a hotfix
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.backgroundColor = Colors.ecGreen
            super.navigationController?.navigationBar.standardAppearance = navBarAppearance
            super.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        }

        setupScrollView()
        setupUserImageView()
        setupHelloLabel()
        setupDaysUntilPaXanLabel()
    }

    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.topMargin)
            make.bottom.equalTo(view.snp.bottomMargin)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    private func setupUserImageView() {
        scrollView.addSubview(userImageView)
        userImageView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.topMargin).offset(40)
            make.size.equalTo(70)
            make.centerX.equalToSuperview()
        }
    }

    private func setupHelloLabel() {
        scrollView.addSubview(helloLabel)
        helloLabel.snp.makeConstraints { make in
            make.top.equalTo(userImageView.snp.bottomMargin).offset(15)
            make.centerX.equalToSuperview()
        }
    }

    private func setupDaysUntilPaXanLabel() {
        scrollView.addSubview(daysUntilPaXanLabel)
        daysUntilPaXanLabel.snp.makeConstraints { make in
            make.top.equalTo(helloLabel.snp.bottomMargin).offset(20)
            make.centerX.equalToSuperview()
        }
    }
}
