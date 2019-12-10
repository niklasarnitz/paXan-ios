// Copyright © 2019 SWDEC. All rights reserved.

import Foundation
import MapKit

/// Struct depicting some locationdata
struct Place: Decodable {
    /// The title/name of the Place/Location
    let title: String
    /// The roomname of the Place/Location
    let roomname: String

    /// The latitude of the coordinates of the place
    let lat: Double

    /// The longitude of the coordinates of the place
    let long: Double

    // MARK: Initializer
    init(title: String, roomname: String, lat: Double, long: Double) {
        self.title = title
        self.roomname = roomname
        self.lat = lat
        self.long = long
    }
}
