//
//  Video.swift
//  todoList
//
//  Created by leon chen on 2/14/17.
//  Copyright © 2017 leon chen. All rights reserved.
//

import UIKit
import SnapKit

let videoURL = "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"
let fullScreenPlayer = FullScreenPlayer()

class VideoController: UIViewController, FullScreenAble {
    
    @IBOutlet weak var videoTitle: UILabel!
    
    var videoName: String?
    lazy var box = UIView()
    var player: VideoPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Video"
        
        videoTitle.text = videoName
        
        self.view.addSubview(box)
        
        box.snp.makeConstraints { (make) in
            make.width.equalTo(400)
            make.height.equalTo(400)
            make.center.equalTo(self.view)
        }
        
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        player = VideoPlayer()
        if let p = player {
            p.videoURL = videoURL
            box.addSubview(p.view)
            p.view.frame = box.bounds
            p.fullScreenDelegate = self
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        player?.stop()
    }
    
    func fullScreen() {
        player?.pause()
        fullScreenPlayer.videoURL = videoURL
        fullScreenPlayer.position = 0
        present(fullScreenPlayer as UIViewController, animated: true)
    }
}
