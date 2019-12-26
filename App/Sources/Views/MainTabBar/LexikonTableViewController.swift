// Copyright © 2019 SWDEC. All rights reserved.

import SwiftyUserDefaults
import UIKit

class LexikonTableViewController: UITableViewController {
    private var detailViewController: LexikonDetailViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        fixNavigationBar()

        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count - 1] as! UINavigationController).topViewController as? LexikonDetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController?.isCollapsed ?? false
        super.viewWillAppear(animated)
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Defaults.lexikonEntries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lexikonCell", for: indexPath)

        let imageView = UIImageView(image: Images.chevronRight)
        cell.addSubview(imageView)
        imageView.tintColor = Colors.ecGreen
        imageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
            make.size.equalTo(cell.bounds.height - 20)
        }

        let lexikonEntryData = Defaults.lexikonEntries[indexPath.row]
        cell.textLabel!.text = lexikonEntryData.title
        cell.textLabel!.font = .buttonBody

        cell.textLabel!.textColor = .black

        cell.imageView?.image = Images.userManual
        cell.imageView?.tintColor = Colors.ecGreen

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailData = Defaults.lexikonEntries[indexPath.row]
        present(
            LexikonDetailViewController(
                title: detailData.title,
                description: detailData.description
            )!,
            animated: true
        )
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
