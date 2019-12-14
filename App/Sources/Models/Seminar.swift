// swiftlint:disable force_try
// Copyright © 2019 SWDEC. All rights reserved.

import Foundation
import ObjectMapper
import SwiftyUserDefaults
import UIKit.UIImage

/// The struct depicting a Seminar
struct Seminar: Codable, Mappable, DefaultsSerializable {
    // MARK: Properties
    /// The Seminar's title
    var title: String
    /// The organizer of the Seminar
    var referent: String
    /// A short (or long) description of the Seminar
    var description: String

    /// roomname of Seminar
    var roomname: String

    /// Lattitude of Seminar
    var lat: Double

    /// Longitude of Seminar
    var long: Double

    /// Number of the seminar unit
    var time: Date

    // MARK: Initializer
    init(title: String, referent: String, description: String, roomname: String, lat: Double, long: Double, time: Date) {
        self.title = title
        self.referent = referent
        self.description = description
        self.roomname = roomname
        self.lat = lat
        self.long = long
        self.time = time
    }

    init() {
        self.title = ""
        self.referent = ""
        self.description = ""
        self.roomname = ""
        self.lat = 0
        self.long = 0
        self.time = Date()
    }

    init?(map: Map) {
        self.title = ""
        self.referent = ""
        self.description = ""
        self.roomname = ""
        self.lat = 0
        self.long = 0
        self.time = Date()
    }

    mutating func mapping(map: Map) {
        title <- map["title"]
        referent <- map["referentName"]
        description <- map["description"]
        roomname <- map["roomname"]
        lat <- map["lat"]
        long <- map["long"]
        time = try! map.value("time", using: DateTransform())
    }
}
