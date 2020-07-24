//
//  JFVideoPlayerViewController.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/8/27.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit
import Player
import NVActivityIndicatorView


class JFVideoPlayerViewController: JFBaseViewController,PlayerDelegate,PlayerPlaybackDelegate {

    var videoUrl:String?
    
    fileprivate var  player:Player?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.player = Player()
        self.player?.playerDelegate = self
        self.player?.playbackDelegate = self
        self.player?.view.frame = self.view.bounds
        
        self.addChild(self.player!)
        self.view.addSubview((self.player?.view)!)
        self.player?.didMove(toParent: self)
        
        
        
        self.player?.url = URL.init(string: videoUrl!)
        
        self.player?.playFromBeginning()


        
        // Do any additional setup after loading the view.
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension JFVideoPlayerViewController:NVActivityIndicatorViewable {
    
    func playerCurrentTimeDidChange(_ player: Player) {
        
    }
    
    func playerPlaybackWillStartFromBeginning(_ player: Player) {
        //开始loding
        startAnimating()
    }
    
    func playerPlaybackDidEnd(_ player: Player) {
        
    }
    
    func playerPlaybackWillLoop(_ player: Player) {
        
    }
    
    func playerReady(_ player: Player) {
         self.stopAnimating()
    }
    
    func playerPlaybackStateDidChange(_ player: Player) {
        
    }
    
    func playerBufferingStateDidChange(_ player: Player) {
        
    }
    
    func playerBufferTimeDidChange(_ bufferTime: Double) {
        
    }
    
    func player(_ player: Player, didFailWithError error: Error?) {
        
    }
    
}
