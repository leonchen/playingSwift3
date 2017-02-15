//
//  FullScreenPlayer.swift
//  todoList
//
//  Created by leon chen on 2/15/17.
//  Copyright © 2017 leon chen. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class FullScreenPlayer: UIViewController {
    
    var videoURL: String?
    var position: Float?
    
    var videoPlayer: AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: videoURL!)!
        videoPlayer = AVPlayer(url: url)
        let playerController = AVPlayerViewController()
        playerController.player = videoPlayer!
        playerController.view.frame = self.view.bounds
        playerController.showsPlaybackControls = true
        self.view.addSubview(playerController.view)
        self.addChildViewController(playerController)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        videoPlayer?.play()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    
}
