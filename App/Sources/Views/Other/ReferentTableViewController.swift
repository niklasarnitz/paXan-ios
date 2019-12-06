// swiftlint:disable file_types_order
// Copyright © 2019 SWDEC. All rights reserved.

import UIKit

class ReferentTableViewController: UIViewController {
    private lazy var tableView = ReferentsTableViewController()
    private lazy var doneButton = SeminarButton(text: "Fertig")

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        setupTableView()
        setupDoneButton()
    }

    private func setupTableView() {
        view.addSubview(tableView.view)
        tableView.view.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-80)
        }
    }

    private func setupDoneButton() {
        view.addSubview(doneButton!)
        doneButton?.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }

        doneButton?.addTarget(self, action: #selector(doneButtonPressed), for: .touchUpInside)
    }

    @objc
    private func doneButtonPressed() {
        doneButton?.pulsate()

        dismiss(animated: true)
    }
}

private class ReferentsTableViewController: UITableViewController {
    private let cellId: String = "referent"

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
        return referents.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)

        let referentData = referents[indexPath.row]
        cell.textLabel!.text = referentData.name
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let referentData = referents[indexPath.row]
        present(
            ReferentDetailViewController(referent: referentData),
            animated: true
        )
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
