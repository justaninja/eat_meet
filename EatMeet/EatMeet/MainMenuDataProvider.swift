//
//  MainMenuDataProvider.swift
//  EatMeet
//
//  Created by Konstantin Khokhlov on 16.08.17.
//  Copyright © 2017 Konstantin Khokhlov. All rights reserved.
//

import UIKit
import RealmSwift

class MainMenuDataProvider: NSObject, UITableViewDataSource {

    // MARK: - Nested
    private struct Keys {
        static let cellIdentifier = "MainCell"
    }

    // MARK: - Properties
    /// Returns all MainMenuItems in the Menu Realm.
    private var menuItems: Results<MainMenuItem>! = {
        guard let realm = try? Realm(configuration: RealmConfig.menu.configuration) else {
            fatalError("There should be a realm")
        }
        return realm.objects(MainMenuItem.self)
    }()

    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Keys.cellIdentifier) else {
            fatalError("There should be a cell")
        }
        cell.textLabel?.text = menuItems[indexPath.row].name

        return cell
    }
}
