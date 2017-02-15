//
//  MainController.swift
//  todoList
//
//  Created by leon chen on 2/9/17.
//  Copyright © 2017 leon chen. All rights reserved.
//

import UIKit

class MainController: UITabBarController {
    @IBOutlet weak var tabs: UITabBar!
    @IBOutlet weak var listContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainList = MainListController(style: UITableViewStyle.plain)
        let profileController = ProfileController()
        
        let list = UINavigationController(rootViewController: mainList as UIViewController)
        list.tabBarItem.title = "List"
        let profile = UINavigationController(rootViewController: profileController as UIViewController)
        profile.tabBarItem.title = "Profile"
        
        self.viewControllers = [list, profile]
        
        self.selectedIndex = 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
