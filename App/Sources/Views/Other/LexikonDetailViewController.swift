// Copyright © 2019 SWDEC. All rights reserved.

import UIKit

class LexikonDetailViewController: UIViewController {
    private lazy var titleLabel = TitleLabel(text: "")
    private lazy var descriptionTextView = DescriptionTextView()
    private lazy var doneButton = SetupButton(text: "Fertig")
    private lazy var verticalView = VerticalViewController(arrangedSubviews: [descriptionTextView])

    init(title: String, description: String) {
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

        view.backgroundColor = Colors.ecGreen

        setupTitleLabel()
        setupDoneButton()
        setupDescriptionTextView()
    }

    private func setupTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }

    private func setupDescriptionTextView() {
        view.addSubview(verticalView.view)
        verticalView.view.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottomMargin).offset(20)
            make.bottom.equalTo(doneButton.snp.topMargin).offset(-20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }

    private func setupDoneButton() {
        view.addSubview(doneButton)
        doneButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.bottom.equalToSuperview().offset(-50)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }

        doneButton.addTarget(self, action: #selector(didPressDone), for: .touchUpInside)
    }

    @objc
    func didPressDone() {
        doneButton.pulsate()
        dismiss(animated: true)
    }
}
