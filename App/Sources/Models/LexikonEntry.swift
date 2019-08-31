//
//  LexikonEntry.swift
//  paXan
//
//  Created by Niklas Arnitz on 27.08.19.
//  Copyright © 2019 SWDEC. All rights reserved.
//

import Foundation
import MapKit

struct LexikonEntry {
    var title: String
    var description: String
    var mapCoordinate: CLLocationCoordinate2D

    init?(title: String, description: String) {
        self.title = title
        self.description = description
        self.mapCoordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    }
}
