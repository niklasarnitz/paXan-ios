// Copyright © 2019 SWDEC. All rights reserved.

import SnapKit
import UIKit

extension UIView {
    /// This function Binds the Edges of the View to the Superview
    /// Please know that if there is no superview, the app crashes.
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

extension UIImage {
    func aspectFittedToMaxLengthData(maxLength: CGFloat) -> UIImage {
        let scale = maxLength / max(self.size.height, self.size.width)
        let format = UIGraphicsImageRendererFormat()
        format.scale = scale
        let renderer = UIGraphicsImageRenderer(size: self.size, format: format)
        return renderer.image(actions: { _ in
                self.draw(in: CGRect(origin: .zero, size: self.size))
            }
        )
    }
}
