// Copyright © 2019 SWDEC. All rights reserved.

import SwiftyUserDefaults

extension DefaultsKeys {
    var username: DefaultsKey<String?> { return .init("username") }

    var didLaunchBefore: DefaultsKey<Bool> { return .init("didLaunchBefore", defaultValue: false) }

    var seminarOne: DefaultsKey<String> { return .init("seminarOne", defaultValue: "") }

    var seminarTwo: DefaultsKey<String> { return .init("seminarTwo", defaultValue: "") }

    var seminarThree: DefaultsKey<String> { return .init("seminarThree", defaultValue: "") }
}
