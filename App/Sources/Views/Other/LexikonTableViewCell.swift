// Copyright © 2020 SWDEC. All rights reserved.

import UIKit

class LexikonTableViewCell: UITableViewCell {
    var lexikonEntry: LexikonEntry? {
        didSet {
            titleLabel.text = lexikonEntry?.title
        }
    }

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        return(label)
    }()
    private lazy var leftImageView: UIImageView = {
        let imageView = UIImageView(image: Images.userManual)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = Colors.ecGreen
        return imageView
    }()
    private lazy var rightImageView: UIImageView = {
        let imageView = UIImageView(image: Images.chevronRight)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = Colors.ecGreen
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        titleLabel.textColor = .black

        addSubview(leftImageView)
        addSubview(titleLabel)
        addSubview(rightImageView)

        leftImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.size.equalTo(bounds.height - 20)
        }

        rightImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
            make.size.equalTo(bounds.height - 20)
        }

        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(leftImageView.snp.trailingMargin).offset(20)
            make.trailing.equalTo(rightImageView.snp.leadingMargin).offset(20)
            make.centerY.equalToSuperview()
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
