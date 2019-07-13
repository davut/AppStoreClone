//
//  BaseTabBarViewController.swift
//  AppStoreClone
//
//  Created by djepbarov on 9.04.2019.
//  Copyright © 2019 Davut. All rights reserved.
//

import UIKit

class BaseTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [
        createViewController(title: "Apps", imageName: "apps", viewController: AppsViewController()),
        createViewController(title: "Search", imageName: "search", viewController: SearchViewController()),
        createViewController(title: "Today", imageName: "today", viewController: UIViewController()),
        ]
    }
    
    func createViewController(title: String, imageName: String, viewController: UIViewController) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.prefersLargeTitles = true
        viewController.title = title
        return navigationController
    }

}
