//
//  GroupsBuilder.swift
//  EatMeet
//
//  Created by Konstantin Khokhlov on 16.08.17.
//  Copyright © 2017 Konstantin Khokhlov. All rights reserved.
//

import UIKit

class GroupsBuilder {

    /// Instantiates and returns the initial navigation controller.
    ///
    /// - Parameter title: A title string for a view.
    /// - Returns: The initial view controller in the Groups storyboard.
    static func instantiateNavigationController(with title: String) -> UINavigationController {
        let bundle = Bundle(for: self)
        let storyboard = UIStoryboard(name: "Groups", bundle: bundle)

        guard let navigationController = storyboard.instantiateInitialViewController() as? UINavigationController,
        let viewController = navigationController.viewControllers.first as? GroupsTableViewController else {
                fatalError("There should be a navigation controller")
        }

        viewController.title = title
        let groupType = GroupType(rawValue: title.lowercased())
        viewController.groupType = groupType

        return navigationController
    }
}
