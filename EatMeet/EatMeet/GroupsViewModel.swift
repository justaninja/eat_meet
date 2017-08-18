//
//  GroupsViewModel.swift
//  EatMeet
//
//  Created by Konstantin Khokhlov on 17.08.17.
//  Copyright © 2017 Konstantin Khokhlov. All rights reserved.
//

import Foundation
import SwiftyJSON

struct GroupsViewModel {

    // MARK: - Nested
    private struct Keys {
        static let categories = "categories"
    }

    // MARK: - Properties
    private let groups: [Group]

    /// The number of categories in the view model.
    var count: Int {
        return groups.count
    }

    // MARK: - Inits
    init(json: JSON) {
        let array = json[Keys.categories].arrayValue
        groups = array.map { Group(json: $0[Keys.categories]) }
    }

    /// Returns a tuple of category data.
    ///
    /// - Parameter index: An index for a row.
    /// - Returns: A tuple of an ID and a Name for a category.
    func groupInfo(for index: Int) -> (id: Int?, name: String?) {
        let group = groups[index]

        return (group.id, group.name)
    }

}
