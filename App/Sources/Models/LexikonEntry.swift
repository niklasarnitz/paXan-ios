// Copyright © 2019 SWDEC. All rights reserved.

import Foundation

struct LexikonEntry {
    var title: String?
    var description: String?
    var place: Place

    init(title: String?, description: String?, roomname: String?, lat: Double, long: Double) {
        self.title = title
        self.description = description
        self.place = Place(
            title: self.title!,
            roomname: roomname!,
            lat: lat,
            long: long
        )
    }
}
