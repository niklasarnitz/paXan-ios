// Copyright © 2019 SWDEC. All rights reserved.

import UIKit

extension UIButton {
    /// Function that pulsates the Button when pressed
    func pulsate() {
        let pulse: CASpringAnimation = {
            let pulse = CASpringAnimation(keyPath: "transform.scale")

            // MARK: Animation Properties
            pulse.duration = 0.4
            pulse.fromValue = 0.98
            pulse.toValue = 1.0
            pulse.autoreverses = false
            pulse.repeatCount = .zero
            pulse.initialVelocity = 0.5
            pulse.damping = 1.0

            return pulse
        }()

        layer.add(pulse, forKey: nil)
    }
}
