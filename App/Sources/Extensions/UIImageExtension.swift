// swiftlint:disable trailing_closure
// Copyright © 2020 SWDEC. All rights reserved.

import UIKit.UIImage

extension UIImage {
    func aspectFittedToMaxLengthData(maxLength: CGFloat) -> UIImage {
        let scale = maxLength / max(self.size.height, self.size.width)
        let format = UIGraphicsImageRendererFormat()
        format.scale = scale
        let renderer = UIGraphicsImageRenderer(size: self.size, format: format)
        return renderer.image(
            actions: { _ in
                self.draw(in: CGRect(origin: .zero, size: self.size))
            }
        )
    }
}
