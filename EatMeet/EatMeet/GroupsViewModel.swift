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

    // MARK: - Properties
    private let groups: [Group]

    /// The number of categories in the view model.
    var count: Int {
        return groups.count
    }

    // MARK: - Inits
    init(for type: GroupType, json: JSON) {
        let array = json[type.rawValue].arrayValue
        groups = array.map { Group(type: type, json: $0[type.unit]) }
    }

    /// Returns a tuple of group's data.
    ///
    /// - Parameter index: An index for a row.
    /// - Returns: A tuple of an ID and a Name for a group.
    func groupInfo(for index: Int) -> (id: Int?, name: String?) {
        let group = groups[index]

        return (group.id, group.name?.cleared)
    }

}
