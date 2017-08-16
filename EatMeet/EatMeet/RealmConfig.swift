//
//  RealmConfig.swift
//  EatMeet
//
//  Created by Konstantin Khokhlov on 16.08.17.
//  Copyright © 2017 Konstantin Khokhlov. All rights reserved.
//

import Foundation
import RealmSwift

enum RealmConfig {

    case menu

    /// A private instance of a Realm for Main Menu items.
    private static let menuConfig = Realm.Configuration(
        fileURL: Bundle.main.url(forResource: "menu", withExtension: "realm"),
        readOnly: true,
        objectTypes: [MainMenuItem.self])

    /// A public configuration instance of a Realm.
    var configuration: Realm.Configuration {
        switch self {
        case .menu:
            return RealmConfig.menuConfig
        }
    }
}
