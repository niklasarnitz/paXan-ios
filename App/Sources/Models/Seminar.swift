// Copyright © 2019 SWDEC. All rights reserved.

import Foundation
import ObjectMapper
import SwiftyUserDefaults
import UIKit.UIImage

/// The struct depicting a Seminar
struct Seminar: Codable, Mappable, DefaultsSerializable {
    // MARK: Properties
    /// The Seminar's title
    var title: String
    /// The organizer of the Seminar
    var referent: Referent
    /// A short (or long) description of the Seminar
    var description: String
    /// The Location Data for the Seminar
    var place: Place
    /// Number of the seminar unit
    var time: Date

    // MARK: Initializer
    init(title: String, referent: Referent, description: String, place: Place, time: Date) {
        self.title = title
        self.referent = referent
        self.description = description
        self.place = place
        self.time = time
    }

    init() {
        self.title = ""
        self.referent = Referent(name: "", connection: "", website: "", picture: UIImage())
        self.description = ""
        self.place = Place(title: "", roomname: "", lat: 0, long: 0)
        self.time = Date()
    }

    init?(map: Map) {
        self.title = ""
        self.referent = Referent(name: "", connection: "", website: "", picture: UIImage())
        self.description = ""
        self.place = Place(title: "", roomname: "", lat: 0, long: 0)
        self.time = Date()
    }

    mutating func mapping(map: Map) {
        title <- map["title"]
        referent <- map["referent"]
        description <- map["description"]
        place <- map["place"]
        time <- map["time"]
    }
}
