// Copyright © 2019 SWDEC. All rights reserved.

import ObjectMapper
import SwiftyUserDefaults
import UIKit.UIImage

struct Referent: Codable, DefaultsSerializable, Mappable {
    var name: String
    var connection: String
    var website: String
    var picture: Data?

    init(name: String, connection: String, website: String, picture: UIImage) {
        self.name = name
        self.connection = connection
        self.website = website
        self.picture = picture.pngData()
    }

    init?(map: Map) {
        name = ""
        connection = ""
        website = ""
        picture = UIImage().pngData()
    }

    mutating func mapping(map: Map) {
        name <- map["name"]
        connection <- map["connection"]
        website <- map["website"]
        picture <- map["picture"]
    }
}
