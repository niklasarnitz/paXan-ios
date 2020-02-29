// Copyright © 2019 SWDEC. All rights reserved.

import ObjectMapper
import SwiftyUserDefaults
import UIKit.UIImage

struct Referent: Codable, DefaultsSerializable, Mappable {
    var name: String
    var description: String
    var connection: String
    var website: String
    var picture: String

    init(
        name: String,
        description: String,
        connection: String,
        website: String,
        picture: String
    ) {
        self.name = name
        self.description = description
        self.connection = connection
        self.website = website
        self.picture = picture
    }

    init?(map: Map) {
        name = ""
        description = ""
        connection = ""
        website = ""
        picture = ""
    }

    mutating func mapping(map: Map) {
        name <- map["name"]
        description <- map["description"]
        connection <- map["connection"]
        website <- map["website"]
        picture <- map["picture"]
    }
}
