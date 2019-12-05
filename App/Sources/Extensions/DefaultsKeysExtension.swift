// Copyright © 2019 SWDEC. All rights reserved.

import SwiftyUserDefaults

// A extension of the DefaultKeys to define the DataKeys used by SwiftyUserDefaults
extension DefaultsKeys {
    /// Name of the user set during setup
    var username: DefaultsKey<String?> { return .init("username") }

    /// Equals true when the initial Setup is finished/
    var didLaunchBefore: DefaultsKey<Bool> { return .init("didLaunchBefore", defaultValue: false) }

    /// The first Seminar's name
    /// Is set during inital setup
    var seminarOne: DefaultsKey<String> { return .init("", defaultValue: "") }

    /// The second Seminar's name
    /// Is set during initial setup
    var seminarTwo: DefaultsKey<String> { return .init("seminarTwo", defaultValue: "") }

    /// The third Seminar's name
    /// Is set during initial setup
    var seminarThree: DefaultsKey<String> { return .init("seminarThree", defaultValue: "") }
}
