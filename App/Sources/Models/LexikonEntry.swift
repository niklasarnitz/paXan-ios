// swiftlint:disable file_header
// Copyright © 2019 SWDEC. All rights reserved.

import Foundation

struct LexikonEntry {
    var title: String
    var description: String

    init?(title: String, description: String) {
        self.title = title
        self.description = description
    }
}
