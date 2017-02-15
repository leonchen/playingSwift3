//
//  VideoPlayer.swift
//  todoList
//
//  Created by leon chen on 2/13/17.
//  Copyright © 2017 leon chen. All rights reserved.
//

import Foundation
import AVKit
import AVFoundation

let fullScreenImage = UIImage(named: "fullScreen")

protocol FullScreenAble {
   func fullScreen()
}

class VideoPlayer: AVPlayerViewController, PlayPauseHandler {
    let touchLayer = UIButton()
    var videoPlayer: AVPlayer?
    let playPauseButton = PlayPauseButton(width: 100, height: 100)
    var hideButtonTimer = Timer()
    
    var videoURL: String?
    
    var fullScreenDelegate: FullScreenAble?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: videoURL!)!
        videoPlayer = AVPlayer(url: url)
        let playerController = AVPlayerViewController()
        playerController.player = videoPlayer!
        playerController.view.frame = self.view.bounds
        playerController.showsPlaybackControls = false
        self.view.addSubview(playerController.view)
        self.addChildViewController(playerController)
        
        self.view.addSubview(touchLayer)
        touchLayer.addTarget(self, action: #selector(touchVideo), for: .touchUpInside)
        
        self.view.addSubview(playPauseButton)
        playPauseButton.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
        }
        playPauseButton.delegate = self
        
        let fullScreenButton = UIButton(type: UIButtonType.custom)
        fullScreenButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        fullScreenButton.setImage(fullScreenImage, for: .normal)
        self.view.addSubview(fullScreenButton)
        fullScreenButton.snp.makeConstraints{ (make) in
            make.top.equalTo(10)
            make.right.equalTo(10)
        }
        fullScreenButton.addTarget(self, action: #selector(fullScreen), for: .touchUpInside)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        touchLayer.frame = self.view.frame
    }
    
    func play() {
        videoPlayer?.play()
        hideButtonTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.hidePlayPauseButton), userInfo: nil, repeats: false)
    }
    
    func pause() {
        hideButtonTimer.invalidate()
        playPauseButton.alpha = 1
        videoPlayer?.pause()
    }
    
    func fullScreen() {
        self.fullScreenDelegate?.fullScreen()
    }
    
    func stop() {
        videoPlayer?.replaceCurrentItem(with: nil)
    }
    
    func hidePlayPauseButton() {
        playPauseButton.alpha = 0
    }
    
    func touchVideo() {
        hideButtonTimer.invalidate()
       
        if playPauseButton.alpha != 1 {
            playPauseButton.alpha = 1
        }
        
        if playPauseButton.playing {
            hideButtonTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.hidePlayPauseButton), userInfo: nil, repeats: false)
        }
    }
}
