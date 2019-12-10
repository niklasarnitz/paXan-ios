// Copyright © 2019 SWDEC. All rights reserved.

import UIKit

struct Referent: Codable {
    var name: String
    var connection: String
    var website: String
    var picture: Data

    init(name: String, connection: String, website: String, picture: UIImage) {
        self.name = name
        self.connection = connection
        self.website = website
        self.picture = picture.pngData()!
    }
}
