//
//  VideoViewcontroller.swift
//  Swift Code Project
//
//  Created by sws on 2021/3/2.
//

import Foundation
import UIKit

class VideoViewcontroller: UIViewController {
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension VideoViewcontroller:playerControlProtocol{
    var videoView: Int {
        get {
            return 0
        }
        set {
            self.videoView = 1
        }
    }
    
    func startPlayMethod(vid: Int) {
        print("")
    }
}
