// Copyright © 2019 SWDEC. All rights reserved.

import SwiftyUserDefaults

extension DefaultsKeys {
    var username: DefaultsKey<String?> { return .init("username") }
    var launchCount: DefaultsKey<Int> { return .init("launchCount", defaultValue: 0) }
}
