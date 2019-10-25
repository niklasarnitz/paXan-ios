// Copyright © 2019 SWDEC. All rights reserved.

import UIKit

class AboutViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }

        // TODO: Fix the navigationbar on iOS 13. This is only a hotfix
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.backgroundColor = Colors.ecGreen
            super.navigationController?.navigationBar.standardAppearance = navBarAppearance
            super.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        }
    }
}
