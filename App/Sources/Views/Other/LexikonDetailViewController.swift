// Copyright © 2019 SWDEC. All rights reserved.

import UIKit

class LexikonDetailViewController: UIViewController {
    private lazy var titleLabel = TitleLabel(text: "")!

    private lazy var descriptionTextView = DescriptionTextView()

    init?(title: String, description: String) {
        super.init(nibName: nil, bundle: nil)

        self.titleLabel.text = title
        self.descriptionTextView.text = description
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }

        setupTitleLabel()
        setupDescriptionTextView()
    }

    private func setupTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
        }
    }

    private func setupDescriptionTextView() {
        view.addSubview(descriptionTextView)
        descriptionTextView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottomMargin).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalTo(super.view.snp.bottomMargin).offset(-20)
        }
    }
}
