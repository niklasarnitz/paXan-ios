//
//  LexikonTableViewController.swift
//  paXan
//
//  Created by Niklas Arnitz on 31.08.19.
//  Copyright © 2019 SWDEC. All rights reserved.
//

import MapKit
import UIKit

class LexikonTableViewController: UITableViewController {
    private var detailViewController: LexikonDetailViewController? = nil

    private var data: [LexikonEntry?] =
                            [
        LexikonEntry(
            title: "paXan",
            description: "paXan ist ein Mitarbeiterkongress des SWDEC"
        ),
        LexikonEntry(
            title: "Jesus",
            description: "Gottes Sohn, Retter aller, welche an ihn glauben"
        ),
        LexikonEntry(
            title: "SWDEC",
            description: "Der SWDEC ist ein Unterverband der Weltweiten EC-Bewegung.\nEs is ein Verband christlicher Jugendarbeiten, bei denen Jesus Christus im Mittelpunkt des Lebens der Mitglieder und der Gemeinden steht.\nDer SWDEC arbeitet ebenfalls eng mit den Liebenzeller Gemeinschaften und der Evangelischen Landeskirche zusammen."
        )
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? LexikonDetailViewController
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
        return data.count
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

        let lexikonEntryData = data[indexPath.row]
        cell.textLabel!.text = lexikonEntryData?.title

        cell.imageView?.image = Images.userManual
        cell.imageView?.tintColor = Colors.ecGreen

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailData = data[indexPath.row]
        let sheetViewController = InteractiveSheetViewController(containing: LexikonDetailViewController(detailData?.title ?? "", detailData!.description)!)
        present(sheetViewController, animated: true)
    }
}
