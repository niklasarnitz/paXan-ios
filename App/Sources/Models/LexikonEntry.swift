// Copyright © 2019 SWDEC. All rights reserved.

import Foundation

struct LexikonEntry: Codable {
    var title: String
    var description: String

    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
}
