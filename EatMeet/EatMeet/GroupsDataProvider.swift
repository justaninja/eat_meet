//
//  GroupsDataProvider.swift
//  EatMeet
//
//  Created by Konstantin Khokhlov on 17.08.17.
//  Copyright © 2017 Konstantin Khokhlov. All rights reserved.
//

import UIKit

class GroupsDataProvider: NSObject, UITableViewDataSource {

    // MARK: - Nested
    private struct Keys {
        static let cellIdentifier = "GroupCell"
    }

    // MARK: - Properties
    var viewModel: CategoryViewModel!

    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Keys.cellIdentifier) else {
            fatalError("There should be a cell")
        }
        let data = viewModel.categoryData(for: indexPath.row)
        cell.textLabel?.text = data.name

        return cell
    }
}
