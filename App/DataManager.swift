// Copyright © 2019 SWDEC. All rights reserved.

import Alamofire
import SwiftyUserDefaults
import ObjectMapper
import AlamofireObjectMapper
import Foundation

class DataManager {
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
                    Defaults.lexikonEntries = try response.result.get()
                }
                catch {
                    print(error)
                    Defaults.lexikonEntries = backupLexikonEntries
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
                    Defaults.seminars = try response.result.get()
                }
                catch {
                    print(error)
                    Defaults.seminars = backupSeminars
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
                    Defaults.referents = try response.result.get()
                }
                catch {
                    print(error)
                    Defaults.referents = backupSpeakers
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
