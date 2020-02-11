// Copyright © 2019 SWDEC. All rights reserved.

import IQKeyboardManagerSwift
import SwiftyUserDefaults
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private var dataManager = DataManager()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if CommandLine.arguments.contains("--uitesting") {
            Defaults.didLaunchBefore = false
        }

        // Enable IQKeyboardManager
        IQKeyboardManager.shared.enable = true

        // Launch Setup Assistant if app is launched the first time
//        Defaults.didLaunchBefore = false
        dataManager = DataManager()
        if Defaults.didLaunchBefore {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let initialViewController = storyboard.instantiateInitialViewController()
            self.window?.rootViewController = initialViewController
        } else {
            if let window = self.window {
                window.rootViewController = FirstSetupPageViewController()
            }
        }

        self.window?.makeKeyAndVisible()

        return true
    }
}
