// Copyright © 2019 SWDEC. All rights reserved.

import UIKit

class ProfilePictureImageView: UIImageView {
    init() {
        super.init(frame: .zero)
    }

    init(image: UIImage) {
        super.init(frame: .zero)
        self.image = maskRoundedImage(image: image, radius: image.size.height / 2)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func maskRoundedImage(image: UIImage, radius: CGFloat) -> UIImage {
        let imageView = UIImageView(image: image)
        let layer = imageView.layer

        layer.masksToBounds = true
        layer.cornerRadius = radius

        UIGraphicsBeginImageContext(imageView.bounds.size)

        layer.render(in: UIGraphicsGetCurrentContext()!)

        let roundedImage = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return roundedImage!
    }
}
