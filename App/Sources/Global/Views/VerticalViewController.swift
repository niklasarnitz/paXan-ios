// Copyright © 2020 SWDEC. All rights reserved.

import UIKit

class VerticalViewController: UIViewController {
    private lazy var scrollView = UIScrollView()
    private lazy var stackView = UIStackView()

    init(arrangedSubviews: [UIView]) {
        super.init(nibName: nil, bundle: nil)

        arrangedSubviews.forEach { view in
            stackView.addArrangedSubview(view)
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(scrollView)
        scrollView.bindEdgesToSuperview()

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
}
