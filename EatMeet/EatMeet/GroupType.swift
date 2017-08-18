//
//  GroupType.swift
//  EatMeet
//
//  Created by Konstantin Khokhlov on 18.08.17.
//  Copyright © 2017 Konstantin Khokhlov. All rights reserved.
//

import Foundation

enum GroupType: String {

    private struct Keys {

        static let categoryID = "id"
        static let categoryName = "name"

        static let collectionID = "collection_id"
        static let collectionName = "title"

        static let cuisineID = "cuisine_id"
        static let cuisineName = "cuisine_name"

        static let establishmentID = "id"
        static let establishmentName = "name"
    }

    case categories, collections, cuisines, establishments

    /// Returns a key for a second-level dictionary.
    var unit: String {
        switch self {
        case .categories:
            return self.rawValue
        case .collections, .cuisines, .establishments:
            var name = self.rawValue
            _ = name.remove(at: name.index(before: name.endIndex))
            return name
        }
    }

    /// Returns a key for an ID.
    var id: String {
        switch self {
        case .categories:
            return Keys.categoryID
        case .collections:
            return Keys.collectionID
        case .cuisines:
            return Keys.cuisineID
        case .establishments:
            return Keys.establishmentID
        }
    }

    /// Returns a key for a name.
    var name: String {
        switch self {
        case .categories:
            return Keys.categoryName
        case .collections:
            return Keys.collectionName
        case .cuisines:
            return Keys.cuisineName
        case .establishments:
            return Keys.establishmentName
        }
    }
}
