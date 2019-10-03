// swiftlint:disable file_header too_much_indentation
// Copyright © 2019 SWDEC. All rights reserved.

import Foundation
import MapKit

struct Seminar {
    var title: String
    var description: String
    var location: CLLocationCoordinate2D

    init?(_ title: String, description: String, location: CLLocationCoordinate2D) {
        self.title = title
        self.description = description
        self.location = location
    }
}
