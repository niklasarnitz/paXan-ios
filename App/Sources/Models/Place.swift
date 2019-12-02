// Copyright © 2019 SWDEC. All rights reserved.

import Foundation
import MapKit

/// Locationdata that is either associated with a Seminar or a LexiconEntry
struct Place {
    /// The title/name of the Place/Location
    let title: String?
    /// The roomname of the Place/Location
    let roomname: String?
    /// The MKPointAnnotation of the place to be placed on a map
    let annotation: MKPointAnnotation?

    init(title: String, roomname: String, lat: Double, long: Double) {
        self.title = title
        self.roomname = roomname
        self.annotation = MKPointAnnotation()
        annotation?.title = self.title
        annotation?.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
    }
}
