// Copyright © 2019 SWDEC. All rights reserved.

import MapKit
import UIKit

class SeminarsTableViewController: UITableViewController {
    private var detailViewController: LexikonDetailViewController?

    private var cellId = "seminarCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
            tableView.backgroundColor = .systemBackground
            tableView.backgroundView?.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
            tableView.backgroundColor = .white
            tableView.backgroundView?.backgroundColor = .white
        }

        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count - 1] as! UINavigationController).topViewController as? LexikonDetailViewController
        }

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
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
        return seminars.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)

        let imageView = UIImageView(image: Images.chevronRight)
        cell.addSubview(imageView)
        imageView.tintColor = Colors.ecGreen
        imageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
            make.size.equalTo(cell.bounds.height - 20)
        }

        let seminarData = seminars[indexPath.row]
        cell.textLabel!.text = seminarData.title

        cell.imageView?.image = Images.userManual
        cell.imageView?.tintColor = Colors.ecGreen

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailData = seminars[indexPath.row]
        present(
            SeminarDetailViewController(seminar: detailData)!,
            animated: true
        )
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
