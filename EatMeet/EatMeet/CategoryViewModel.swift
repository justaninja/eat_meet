//
//  CategoryViewModel.swift
//  EatMeet
//
//  Created by Konstantin Khokhlov on 17.08.17.
//  Copyright © 2017 Konstantin Khokhlov. All rights reserved.
//

import Foundation
import SwiftyJSON

struct CategoryViewModel {

    // MARK: - Nested
    private struct Keys {
        static let categories = "categories"
    }

    // MARK: - Properties
    private let categories: [Category]

    /// The number of categories in the view model.
    var count: Int {
        return categories.count
    }

    // MARK: - Inits
    init(json: JSON) {
        let array = json[Keys.categories].arrayValue
        categories = array.map { Category(json: $0[Keys.categories]) }
    }
    
    /// Returns a tuple of category data.
    ///
    /// - Parameter index: An index for a row.
    /// - Returns: A tuple of an ID and a Name for a category.
    func categoryData(for index: Int) -> (id: Int?, name: String?) {
        let category = categories[index]

        return (category.id, category.name)
    }

}
