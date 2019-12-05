// Copyright © 2019 SWDEC. All rights reserved.

import Foundation

/// The struct depicting a Seminar
struct Seminar {
    // MARK: Properties
    /// The Seminar's title
    var title: String?
    /// The organizer of the Seminar
    var referent: String?
    /// A short (or long) description of the Seminar
    var description: String?
    /// The Location Data for the Seminar
    var place: Place?

    // MARK: Initializer
    init?(title: String?, referent: String?, description: String?, setPlace: Place?) {
        self.title = title
        self.referent = referent
        self.description = description
        self.place = setPlace
    }
}
