// swiftlint:disable dynamic_storyboard_reference
// Copyright © 2019 SWDEC. All rights reserved.

import SwiftyUserDefaults
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        /// Launch Setup Assistant if app is launched the first time
        if Defaults.didLaunchBefore {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let initialViewController = storyboard.instantiateInitialViewController()
            self.window?.rootViewController = initialViewController
        } else {
            if let window = self.window {
                window.rootViewController = SetupPageViewController()
            }
            Defaults.didLaunchBefore = true
        }

        self.window?.makeKeyAndVisible()

        return true
    }
}
