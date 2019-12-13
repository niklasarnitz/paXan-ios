// Copyright © 2019 SWDEC. All rights reserved.

import Foundation
import ObjectMapper
import SwiftyUserDefaults

/// Struct depicting some locationdata
struct Place: Codable, DefaultsSerializable, Mappable {
    /// The title/name of the Place/Location
    var title: String
    /// The roomname of the Place/Location
    var roomname: String

    /// The latitude of the coordinates of the place
    var lat: Double

    /// The longitude of the coordinates of the place
    var long: Double

    // MARK: Initializer
    init(title: String, roomname: String, lat: Double, long: Double) {
        self.title = title
        self.roomname = roomname
        self.lat = lat
        self.long = long
    }

    init?(map: Map) {
        self.title = ""
        self.roomname = ""
        self.lat = 0
        self.long = 0
    }

    mutating func mapping(map: Map) {
        title <- map["title"]
        roomname <- map["roomname"]
        lat <- map["lat"]
        long <- map["long"]
    }
}
