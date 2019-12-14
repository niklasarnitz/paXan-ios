// Copyright © 2019 SWDEC. All rights reserved.

import Alamofire
import SwiftyUserDefaults
import ObjectMapper
import AlamofireObjectMapper
import Foundation

class DataManager {
    private let backendUrl: URL?
    private let lexikonUrl: URL?
    private let seminarUrl: URL?
    private let referentUrl: URL?

    private var seminars: [Seminar] = []
    private var lexikonEntries: [LexikonEntry] = []
    private var referents: [Referent] = []

    init(backendUrl: String) {
        self.backendUrl = URL(string: backendUrl)
        self.lexikonUrl = URL(string: (backendUrl + "lexikon"))
        self.seminarUrl = URL(string: (backendUrl + "seminar"))
        self.referentUrl = URL(string: (backendUrl + "speaker"))

        loadLexikonEntries()
        loadSeminars()
        loadReferents()
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
            }
        } else {
            Defaults.seminars = backupSeminars
        }
    }

    func loadReferents() {
        if(NetworkReachabilityManager()?.isReachable ?? false) {
            AF.request(referentUrl!).responseArray { (response: AFDataResponse<[Referent]>) in
                self.referents = try! response.result.get()
                Defaults.referents = self.referents
            }
        } else {
            Defaults.referents = backupSpeakers
        }
    }
}
