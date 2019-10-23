// Copyright © 2019 SWDEC. All rights reserved.

import SwiftyUserDefaults
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        /// Launch Setup Assistant if app is launched the first time
        switch Defaults.launchCount {
        case 0:
            // Launch Setup Assistant
            print("First Launch!")

        default:
            // Launch app, do nothing
            Defaults.launchCount += 1
        }

        return true
    }
}
