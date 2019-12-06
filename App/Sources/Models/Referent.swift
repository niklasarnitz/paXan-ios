// Copyright © 2019 SWDEC. All rights reserved.

import UIKit

struct Referent {
    var name: String?
    var connection: String?
    var website: String?
    var picture: UIImage?

    init(name: String?, connection: String?, website: String?, picture: UIImage) {
        self.name = name
        self.connection = connection
        self.website = website
        self.picture = picture
    }
}
