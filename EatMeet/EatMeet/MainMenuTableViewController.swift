//
//  MainMenuTableViewController.swift
//  EatMeet
//
//  Created by Konstantin Khokhlov on 16.08.17.
//  Copyright © 2017 Konstantin Khokhlov. All rights reserved.
//

import UIKit

class MainMenuTableViewController: UITableViewController {

    // MARK: - Outlets
    @IBOutlet private weak var dataProvider: MainMenuDataProvider!

    // MARK: - UITableViewController
    override func viewDidLoad() {
        tableView.dataSource = dataProvider
        tableView.delegate = self
    }

    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let title = tableView.cellForRow(at: indexPath)?.textLabel?.text
        let controller = GroupsBuilder.instantiateNavigationController(with: title)
        splitViewController?.showDetailViewController(controller, sender: nil)
    }
}
