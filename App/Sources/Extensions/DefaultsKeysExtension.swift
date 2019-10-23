// Copyright © 2019 SWDEC. All rights reserved.

import SwiftyUserDefaults

extension DefaultsKeys {
    var username: DefaultsKey<String?> { return .init("username") }
    var didLaunchBefore: DefaultsKey<Bool> { return .init("didLaunchBefore", defaultValue: false) }
}
