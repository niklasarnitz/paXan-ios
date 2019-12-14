// Copyright © 2019 SWDEC. All rights reserved.

import Alamofire
import SwiftyUserDefaults
import ObjectMapper
import AlamofireObjectMapper
import Foundation

//var referents: [Referent] = []

class DataManager {
    private let backendUrl: URL?
    private let lexikonUrl: URL?
    private let seminarUrl: URL?

    private var seminars: [Seminar] = []
    private var lexikonEntries: [LexikonEntry] = []

    init(backendUrl: String) {
        self.backendUrl = URL(string: backendUrl)
        self.lexikonUrl = URL(string: (backendUrl + "lexikon.php"))
        self.seminarUrl = URL(string: (backendUrl + "seminar"))

        loadLexikonEntries()
        loadSeminars()
    }

    func loadLexikonEntries() {
        if(NetworkReachabilityManager()?.isReachable ?? false) {
            AF.request(lexikonUrl!).responseArray { (response: AFDataResponse<[LexikonEntry]>) in
                self.lexikonEntries = try! response.result.get()
                Defaults.lexikonEntries = self.lexikonEntries
            }
        } else {
            Defaults.lexikonEntries = backupLexikonEntries
        }
    }

    func loadSeminars() {
        if(NetworkReachabilityManager()?.isReachable ?? false) {
            AF.request(seminarUrl!).responseArray { (response: AFDataResponse<[Seminar]>) in
                self.seminars = try! response.result.get()
                Defaults.seminars = self.seminars
                print(Defaults.seminars)
            }
        } else {
            Defaults.seminars = backupSeminars
        }
    }
}
