// Copyright © 2020 SWDEC. All rights reserved.

import SwiftyUserDefaults
import UIKit

class LexikonViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Lexikon"

        configureNavigationBar()
        configureTableView()
    }

    private func configureTableView() {
        tableView.register(LexikonTableViewCell.self, forCellReuseIdentifier: "lexikonCell")
        tableView.dataSource = self
        tableView.delegate = self

        view.addSubview(tableView)
        tableView.bindEdgesToSuperview()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let lexikonEntries = Defaults.lexikonEntries
        let lexikonEntry = lexikonEntries[indexPath.row]

        tableView.deselectRow(at: indexPath, animated: true)

        present(
            LexikonDetailViewController(
                title: lexikonEntry.title,
                description: lexikonEntry.description
            ),
            animated: true
        )
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Defaults.lexikonEntries.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lexikonCell", for: indexPath as IndexPath) as! LexikonTableViewCell
        cell.lexikonEntry = Defaults.lexikonEntries[indexPath.row]
        return cell
    }
}
