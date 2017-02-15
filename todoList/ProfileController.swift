//
//  ProfileController.swift
//  todoList
//
//  Created by leon chen on 2/14/17.
//  Copyright © 2017 leon chen. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {
    @IBOutlet weak var username: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Profile"
        self.view.backgroundColor = UIColor.white
    }
}
