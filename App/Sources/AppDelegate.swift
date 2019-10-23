// swiftlint:disable dynamic_storyboard_reference
// Copyright © 2019 SWDEC. All rights reserved.

import IQKeyboardManagerSwift
import SwiftyUserDefaults
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        // Enable IQKeyboardManager
        IQKeyboardManager.shared.enable = true

        /// Launch Setup Assistant if app is launched the first time
        Defaults.didLaunchBefore = false
        if Defaults.didLaunchBefore {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let initialViewController = storyboard.instantiateInitialViewController()
            self.window?.rootViewController = initialViewController
        } else {
            if let window = self.window {
                window.rootViewController = FirstSetupPageViewController()
            }
            Defaults.didLaunchBefore = true
        }

        self.window?.makeKeyAndVisible()

        return true
    }
}
