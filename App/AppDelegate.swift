// Copyright © 2019 SWDEC. All rights reserved.

import IQKeyboardManagerSwift
import SwiftyUserDefaults
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private var dataManager = DataManager()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        // Enable IQKeyboardManager
        IQKeyboardManager.shared.enable = true

        // Launch Setup Assistant if app is launched the first time
//        Defaults.didLaunchBefore = false
        dataManager = DataManager()
        if Defaults.didLaunchBefore {
            window?.rootViewController = MainTabBar()
        } else {
            if let window = self.window {
                window.rootViewController = FirstSetupPageViewController()
            }
        }

        self.window?.makeKeyAndVisible()

        return true
    }
}
