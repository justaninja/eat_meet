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

    // MARK: - UITableViewController
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = dataProvider

        NetworkClient.shared.getCategories(success: { [weak self] json in
            let viewModel = CategoryViewModel(json: json)
            self?.dataProvider.viewModel = viewModel
            self?.tableView.reloadData()
        }) { messages in
            print("FAILURE:", messages)
        }
    }
}
