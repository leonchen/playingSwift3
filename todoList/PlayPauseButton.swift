//
//  PlayPauseButton.swift
//  todoList
//
//  Created by leon chen on 2/10/17.
//  Copyright © 2017 leon chen. All rights reserved.
//

import UIKit
import SnapKit

protocol PlayPauseHandler {
    func play()
    func pause()
}

let playImage = UIImage(named: "play")
let pauseImage = UIImage(named: "pause")

class PlayPauseButton: UIImageView {
    
    var playing = false
    var width = 0
    var height = 0
    
    var delegate: PlayPauseHandler?
    
    convenience init(width w: Int, height h: Int) {
        self.init(image: playImage)
        
        width = w
        height = h
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(playClicked))
        self.frame = CGRect(x: 0, y: 0, width: width, height: height)
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapRecognizer)
        self.snp.makeConstraints { (make) in
            make.width.equalTo(w)
            make.height.equalTo(h)
        }
    }
    
    func playClicked(_ sender: UITapGestureRecognizer) {
        playing = !playing
        if playing {
            self.image = pauseImage
            delegate?.play()
        } else {
            self.image = playImage
            delegate?.pause()
        }
    }
}
