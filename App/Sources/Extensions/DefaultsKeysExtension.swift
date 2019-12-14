// Copyright © 2019 SWDEC. All rights reserved.

import SwiftyUserDefaults

// A extension of the DefaultKeys to define the DataKeys used by SwiftyUserDefaults
extension DefaultsKeys {
    /// Name of the user set during setup
    var username: DefaultsKey<String?> { return .init("username") }

    /// Equals true when the initial Setup is finished
    var didLaunchBefore: DefaultsKey<Bool> { return .init("didLaunchBefore", defaultValue: false) }

    /// seminars loaded from Strings.swift, gets overwritten if internet connection is available
    var seminars: DefaultsKey<[Seminar]> { return .init("seminars", defaultValue: []) }

    /// lexikonEntries loaded from Strings.swift, gets overwritten if internet connection is available
    var lexikonEntries: DefaultsKey<[LexikonEntry]> { return .init("lexikonEntries", defaultValue: []) }

    /// referents loaded from Strings.swift, gets overwritten if internet connection is available
    var referents: DefaultsKey<[Referent]> { return .init("referents", defaultValue: []) }

    /// The first Seminar's name
    /// Is set during inital setup
    var seminarOne: DefaultsKey<Seminar> {
        return .init(
            "",
            defaultValue: Seminar(
                title: "",
                referent: "",
                description: "",
                roomname: "",
                lat: 0,
                long: 0,
                time: Date()
            )
        )
    }

    /// The second Seminar's name
    /// Is set during initial setup
    var seminarTwo: DefaultsKey<Seminar> {
        return .init(
            "seminarTwo",
            defaultValue:Seminar(
                title: "",
                referent: "",
                description: "",
                roomname: "",
                lat: 0,
                long: 0,
                time: Date()
            )
        )
    }

    /// The third Seminar's name
    /// Is set during initial setup
    var seminarThree: DefaultsKey<Seminar> {
        return .init(
            "seminarThree",
            defaultValue: Seminar(
                title: "",
                referent: "",
                description: "",
                roomname: "",
                lat: 0,
                long: 0,
                time: Date()
            )
        )
    }
}
