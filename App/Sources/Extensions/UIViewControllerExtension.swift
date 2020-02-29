// Copyright © 2019 SWDEC. All rights reserved.

import UIKit

extension UIViewController {
    /// A iOS 13 specific fix for the NavigationBar Background
    func fixNavigationBar() {
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [
                .foregroundColor: UIColor.white,
                .font: UIFont.title
            ]
            navBarAppearance.largeTitleTextAttributes = [
                .foregroundColor: UIColor.white,
                .font: UIFont.title
            ]
            navBarAppearance.backgroundColor = Colors.ecGreen
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        }
    }
}
