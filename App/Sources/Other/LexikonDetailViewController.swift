//
//  LexikonDetailViewController.swift
//  paXan
//
//  Created by Niklas Arnitz on 31.08.19.
//  Copyright © 2019 SWDEC. All rights reserved.
//

import UIKit

class LexikonDetailViewController: UIViewController {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .preferredFont(forTextStyle: .largeTitle)
        return label
    }()

    private lazy var descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.layer.borderColor = UIColor.black.cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 5
        textView.isEditable = false
        return textView
    }()

    init?(_ title: String, _ description: String) {
        super.init(nibName: nil, bundle: nil)

        self.titleLabel.text = title
        self.descriptionTextView.text = description
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTitleLabel()
        setupDescriptionTextView()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
