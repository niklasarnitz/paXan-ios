// swiftlint:disable file_header
// Copyright © 2019 SWDEC. All rights reserved.

import SnapKit
import UIKit

extension UIView {
    public func bindEdgesToSuperview(insets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)) {
        translatesAutoresizingMaskIntoConstraints = false

        snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(insets.top)
            maker.bottom.equalToSuperview().inset(insets.bottom)
            maker.left.equalToSuperview().inset(insets.left)
            maker.right.equalToSuperview().inset(insets.right)
        }
    }
}
