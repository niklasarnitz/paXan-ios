// Copyright © 2019 SWDEC. All rights reserved.

import Foundation
import SwiftyUserDefaults

struct Seminar {
    var title: String?
    var referent: String?
    var description: String?
    var place: Place?

    init?(title: String?, referent: String?, description: String?, setPlace: Place?) {
        self.title = title
        self.referent = referent
        self.description = description
        self.place = setPlace
    }
}
