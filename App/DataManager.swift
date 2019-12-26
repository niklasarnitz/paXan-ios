// Copyright © 2019 SWDEC. All rights reserved.

import Alamofire
import SwiftyUserDefaults
import ObjectMapper
import AlamofireObjectMapper
import Foundation

class DataManager {
    private var seminars: [Seminar] = []
    private var lexikonEntries: [LexikonEntry] = []
    private var referents: [Referent] = []

    private var config = Configuration()

    init() {
        loadLexikonEntries()
        loadSeminars()
        loadReferents()

        sortSeminars()
    }

    func loadLexikonEntries() {
        if(NetworkReachabilityManager()?.isReachable ?? false) {
            AF.request(config.lexikonUrl).responseArray { (response: AFDataResponse<[LexikonEntry]>) in
                do {
                    self.lexikonEntries = try response.result.get()
                    Defaults.lexikonEntries = self.lexikonEntries
                }
                catch {
                    self.lexikonEntries = backupLexikonEntries
                    Defaults.lexikonEntries = self.lexikonEntries
                }
            }
        } else {
            Defaults.lexikonEntries = backupLexikonEntries
        }
    }

    func loadSeminars() {
        if(NetworkReachabilityManager()?.isReachable ?? false) {
            AF.request(config.seminarUrl).responseArray { (response: AFDataResponse<[Seminar]>) in
                do {
                    self.seminars = try response.result.get()
                    Defaults.seminars = self.seminars
                }
                catch {
                    self.seminars = backupSeminars
                    Defaults.seminars = self.seminars
                }
            }
        } else {
            Defaults.seminars = backupSeminars
        }
    }

    func loadReferents() {
        if(NetworkReachabilityManager()?.isReachable ?? false) {
            AF.request(config.speakerUrl).responseArray { (response: AFDataResponse<[Referent]>) in
                do {
                    self.referents = try response.result.get()
                    Defaults.referents = self.referents
                }
                catch {
                    self.referents = backupSpeakers
                    Defaults.referents = self.referents
                }
            }
        } else {
            Defaults.referents = backupSpeakers
        }
    }

    func sortSeminars() {
        Defaults.seminarsOne = []
        Defaults.seminarsTwo = []
        Defaults.seminarsThree = []

        Defaults.seminars.forEach {
            if $0.time == "2020-04-10 15:00:00" {
                Defaults.seminarsOne.append($0)
            }
            if $0.time == "2020-04-10 16:30:00" {
                Defaults.seminarsTwo.append($0)
            }
            if $0.time == "2020-04-11 16:30:00" {
                Defaults.seminarsThree.append($0)
            }
        }
    }
}
