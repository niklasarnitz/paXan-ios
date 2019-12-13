// Copyright © 2019 SWDEC. All rights reserved.

import Foundation
import ObjectMapper
import SwiftyUserDefaults

struct LexikonEntry: Codable, DefaultsSerializable, Mappable {
    var title: String
    var description: String

    init(title: String, description: String) {
        self.title = title
        self.description = description
    }

    init?(map: Map) {
        self.title = ""
        self.description = ""
    }

    mutating func mapping(map: Map) {
        title <- map["title"]
        description <- map["description"]
    }
}
