//
//  Category.swift
//  EatMeet
//
//  Created by Konstantin Khokhlov on 17.08.17.
//  Copyright © 2017 Konstantin Khokhlov. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Category {

    // MARK: - Nested
    private struct Keys {
        static let id = "id"
        static let name = "name"
    }

    // MARK: - Properties
    let id: Int?
    let name: String?

    // MARK: - Inits
    init(json: JSON) {
        id = json[Keys.id].int
        name = json[Keys.name].string
    }

}
