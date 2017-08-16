//
//  MainMenuItem.swift
//  EatMeet
//
//  Created by Konstantin Khokhlov on 16.08.17.
//  Copyright © 2017 Konstantin Khokhlov. All rights reserved.
//

import Foundation
import RealmSwift

class MainMenuItem: Object {

    // MARK: - Properties
    dynamic var name = ""

    // MARK: - Inits
    convenience init(_ name: String) {
        self.init()
        self.name = name
    }
}
