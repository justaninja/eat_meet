//
//  SplitViewController.swift
//  EatMeet
//
//  Created by Konstantin Khokhlov on 17.08.17.
//  Copyright © 2017 Konstantin Khokhlov. All rights reserved.
//

import UIKit

class SplitViewController: UISplitViewController, UISplitViewControllerDelegate {

    // MARK: - UISplitViewController
    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
    }

    // MARK: - UISplitViewControllerDelegate
    func splitViewController(_ splitViewController: UISplitViewController,
                             collapseSecondary secondaryViewController: UIViewController,
                             onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}
