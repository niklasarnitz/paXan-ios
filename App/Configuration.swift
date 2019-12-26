// Copyright © 2019 SWDEC. All rights reserved.

import Foundation

final class Configuration {
    var config: NSDictionary?
    var seminarUrl: URL
    var lexikonUrl: URL
    var speakerUrl: URL

    init() {
        if let path = Bundle.main.path(forResource: "Config", ofType: "plist") {
           config = NSDictionary(contentsOfFile: path)
        }

        seminarUrl = URL(string: config!["seminarUrl"] as! String)!
        lexikonUrl = URL(string: config!["lexikonUrl"] as! String)!
        speakerUrl = URL(string: config!["speakerUrl"] as! String)!
    }
}
