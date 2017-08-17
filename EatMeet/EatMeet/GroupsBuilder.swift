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
    static func instantiateNavigationController(with title: String?) -> UINavigationController {
        let bundle = Bundle(for: self)
        let storyboard = UIStoryboard(name: "Groups", bundle: bundle)

        guard let controller = storyboard.instantiateInitialViewController() as? UINavigationController else {
                fatalError("There should be a navigation controller")
        }
        controller.viewControllers.first?.title = title
        return controller
    }
}
