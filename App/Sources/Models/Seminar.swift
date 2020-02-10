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

    /// The subtitle of the Seminar
    var subtitle: String

    /// The organizer of the Seminar
    var referent: String

    /// roomname of Seminar
    var roomname: String

    /// Lattitude of Seminar
    var lat: Double

    /// Longitude of Seminar
    var long: Double

    /// Number of the seminar unit
    var time: String

    // MARK: Initializer
    init(title: String, subtitle: String, referent: String, roomname: String, lat: Double, long: Double, time: String) {
        self.title = title
        self.subtitle = subtitle
        self.referent = referent
        self.roomname = roomname
        self.lat = lat
        self.long = long
        self.time = time
    }

    init() {
        self.title = ""
        self.subtitle = ""
        self.referent = ""
        self.roomname = ""
        self.lat = 0
        self.long = 0
        self.time = ""
    }

    init?(map: Map) {
        self.title = ""
        self.subtitle = ""
        self.referent = ""
        self.roomname = ""
        self.lat = 0
        self.long = 0
        self.time = ""
    }

    mutating func mapping(map: Map) {
        title <- map["title"]
        subtitle <- map["subtitle"]
        referent <- map["referentName"]
        roomname <- map["roomname"]
        lat <- map["lat"]
        long <- map["long"]
        time <- map["time"]
    }
}
