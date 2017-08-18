//
//  Group.swift
//  EatMeet
//
//  Created by Konstantin Khokhlov on 17.08.17.
//  Copyright © 2017 Konstantin Khokhlov. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Group {

    // MARK: - Properties
    let id: Int?
    let name: String?

    // MARK: - Inits
    init(type: GroupType, json: JSON) {
        id = json[type.id].int
        name = json[type.name].string
    }
}
