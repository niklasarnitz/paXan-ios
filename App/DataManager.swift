// Copyright © 2019 SWDEC. All rights reserved.

import Alamofire
import Foundation

class DataManager {
    private let backendUrl: URL?
    private let lexikonUrl: URL?
    private let seminars: [Seminar] = []
    private let lexikonEntries: [LexikonEntry] = []
    private var referents: [Referent] = []

    init(backendUrl: String) {
        self.backendUrl = URL(string: backendUrl)
        self.lexikonUrl = URL(string: (backendUrl + "lexikon.php"))

        loadLexikonEntries()
    }

    func loadLexikonEntries() {
        AF.request(lexikonUrl!).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                print(value)
            case .failure(let error):
                print(error)
            }
        }
    }
}
