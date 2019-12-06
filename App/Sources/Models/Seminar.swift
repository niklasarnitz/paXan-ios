// Copyright © 2019 SWDEC. All rights reserved.

import Foundation

/// The struct depicting a Seminar
struct Seminar {
    // MARK: Properties
    /// The Seminar's title
    var title: String?
    /// The organizer of the Seminar
    var referent: Referent?
    /// A short (or long) description of the Seminar
    var description: String?
    /// The Location Data for the Seminar
    var place: Place?
    /// Number of the seminar unit
    var seminarUnit: Int?

    // MARK: Initializer
    init(title: String?, referent: Referent?, description: String?, setPlace: Place?, unit: Int?) {
        self.title = title
        self.referent = referent
        self.description = description
        self.place = setPlace
        self.seminarUnit = unit
    }
}
