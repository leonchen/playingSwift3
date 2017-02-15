//
//  MainListController.swift
//  todoList
//
//  Created by leon chen on 2/14/17.
//  Copyright © 2017 leon chen. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire
import SwiftyJSON

var data: [String] = []

class MainListController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Main List"
        self.loadData()
    }
    
    func loadData() {
        Alamofire.request("http://localhost:8180/data.json").validate().responseJSON { resp in
            switch resp.result {
            case .success(let value):
                let json = JSON(value)
                for (_, val): (String, JSON) in json {
                    data.append(val.stringValue)
                }
                self.tableView.reloadData()
            case .failure(let error):
                print("ERROR \(error)")
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "MainListCell") ?? UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "MainListCell")
        cell.textLabel?.text = data[indexPath.row]
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = data[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let videoController = storyboard.instantiateViewController(withIdentifier: "videoController") as! VideoController
        videoController.videoName = name
        self.navigationController?.pushViewController(videoController, animated: true)
    }
    
}
