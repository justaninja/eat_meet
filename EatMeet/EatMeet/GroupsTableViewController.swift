//
//  GroupsTableViewController.swift
//  EatMeet
//
//  Created by Konstantin Khokhlov on 16.08.17.
//  Copyright © 2017 Konstantin Khokhlov. All rights reserved.
//

import UIKit

class GroupsTableViewController: UITableViewController {

    // MARK: - Outlets
    @IBOutlet private weak var dataProvider: GroupsDataProvider!

    // MARK: - Properties
    var groupType: GroupType!

    // MARK: - UITableViewController
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = dataProvider

        NetworkClient.shared.getGroup(for: groupType, success: { [weak self] json in
            guard let type = self?.groupType else {
                fatalError("There should be a group type")
            }
            let viewModel = GroupsViewModel(for: type, json: json)
            self?.dataProvider.viewModel = viewModel
            self?.tableView.reloadData()
        }) { messages in
            print("FAILURE:", messages)
        }
    }
}
