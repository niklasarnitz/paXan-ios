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

    /// seminars loaded from Strings.swift, gets overwritten if internet connection is available
    var seminarsOne: DefaultsKey<[Seminar]> { return .init("seminarsOne", defaultValue: []) }

    /// seminars loaded from Strings.swift, gets overwritten if internet connection is available
    var seminarsTwo: DefaultsKey<[Seminar]> { return .init("seminarsTwo", defaultValue: []) }

    /// seminars loaded from Strings.swift, gets overwritten if internet connection is available
    var seminarsThree: DefaultsKey<[Seminar]> { return .init("seminarsThree", defaultValue: []) }

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
                subtitle: "",
                referent: "",
                description: "",
                roomname: "",
                lat: 0,
                long: 0,
                time: ""
            )
        )
    }

    /// The second Seminar's name
    /// Is set during initial setup
    var seminarTwo: DefaultsKey<Seminar> {
        return .init(
            "seminarTwo",
            defaultValue: Seminar(
                title: "",
                subtitle: "",
                referent: "",
                description: "",
                roomname: "",
                lat: 0,
                long: 0,
                time: ""
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
                subtitle: "",
                referent: "",
                description: "",
                roomname: "",
                lat: 0,
                long: 0,
                time: ""
            )
        )
    }
}
