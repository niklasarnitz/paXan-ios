// Copyright © 2019 SWDEC. All rights reserved.

import Foundation
import MapKit

struct Place {
    let title: String?
    let roomname: String?
    let annotation: MKPointAnnotation?

    init(title: String, roomname: String, lat: Double, long: Double) {
        self.title = title
        self.roomname = roomname
        self.annotation = MKPointAnnotation()
        annotation?.title = self.title
    }
}
