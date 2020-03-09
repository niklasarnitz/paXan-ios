// swiftlint:disable too_much_indentation trailing_closure
// Copyright © 2020 SWDEC. All rights reserved.

import UIKit

class MainTabBar: UITabBarController {
    private let zeitPlanViewController: UINavigationController = {
        let viewController = UINavigationController(rootViewController: ZeitplanViewController())
        viewController.tabBarItem = UITabBarItem(title: "Zeitplan", image: Images.timetable, tag: 0)
        return viewController
    }()
    private let mapViewContoller: UINavigationController = {
        let viewController = UINavigationController(rootViewController: MapViewController())
        viewController.tabBarItem = UITabBarItem(title: "Karte", image: Images.mapMarker, tag: 1)
        return viewController
    }()
    private let stilleZeitViewController: UINavigationController = {
        let viewController = UINavigationController(rootViewController: StilleZeitViewController())
        viewController.tabBarItem = UITabBarItem(title: "Bible & Breakfast", image: Images.book, tag: 2)
        return viewController
    }()
    private let lexikonViewController: UINavigationController = {
        let viewController = UINavigationController(rootViewController: LexikonViewController())
        viewController.tabBarItem = UITabBarItem(title: "Lexikon", image: Images.userManual, tag: 3)
        return viewController
    }()
    private let infoViewController: UINavigationController = {
        let viewController = UINavigationController(rootViewController: InfoViewController())
        viewController.tabBarItem = UITabBarItem(title: "Info", image: Images.info, tag: 4)
        return viewController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [
            zeitPlanViewController,
            mapViewContoller,
            stilleZeitViewController,
            lexikonViewController,
            infoViewController
        ]

        tabBar.tintColor = Colors.ecGreen

        viewControllers?.forEach({ viewController in
                viewController.configureNavigationBar()
            }
        )
    }
}
