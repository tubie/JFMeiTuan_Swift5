//
//  JFGuidePageView.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/8/21.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import MediaPlayer
import SwiftyGif

class JFGuidePageView: UIView,UIScrollViewDelegate {
    
    var playerItem: AVPlayerItem?
    var playerController: AVPlayerViewController!
    
    
    //外部的图片数组
    var imageArray:[String]?
    
    //图片的容器
    var guideScrollView:UIScrollView?
    
    //图片指示器
    var imagePageController:UIControl?
    
    //播放器的VC
//    var playerController:AVPlayerViewController?
    

    
    /// 开屏是图片或者静态图
    ///
    /// - Parameters:
    ///   - imageNameArray: 图片数组
    ///   - isHideSkipBtn: 是否有跳过按钮
    init(imageNameArray:[String],isHideSkipBtn:Bool) {
        let frame  = CGRect.init(x: 0, y: 0, width: JFSCREEN_WIDTH, height:JFSCREEN_HEIGHT)
        super.init(frame: frame)
        imageArray = imageNameArray
        if imageArray == nil || imageArray?.count == 0 {
            return
        }
        
        addScrollView(frame: frame)
        addImages()
        addSkipButton(isHiddenSkipButton: isHideSkipBtn)
        addPageControl()
    }
    
    
    /// 开屏视屏
    ///
    /// - Parameters:
    ///   - videoUrl: 视频的URL
    ///   - isHideSkipBtn: 是否有跳过按钮
    init(videoUrl:URL,isHideSkipBtn:Bool) {
        let frame  = CGRect.init(x: 0, y: 0, width: JFSCREEN_WIDTH, height:JFSCREEN_HEIGHT)
        super.init(frame: frame)
        
        //初始化播放器
//        playerController = MPMoviePlayerController.init(contentURL: videoUrl)
//        playerController?.view.frame = frame
//        playerController?.view.alpha = 1.0
//        playerController?.controlStyle = .none
//        playerController?.repeatMode = .one
//        playerController?.shouldAutoplay = true
//        playerController?.prepareToPlay()
//        addSubview((playerController?.view)!)
        
        
        playerController = AVPlayerViewController()
        playerItem = AVPlayerItem(url: videoUrl)
        playerController.player = AVPlayer(playerItem: playerItem)
        playerController.videoGravity = .resizeAspectFill
        playerController.view.frame = frame
        addSubview(playerController.view)
        
        
        //初始化开始按钮
        let movieStartBtn = UIButton.init(frame: CGRect.init(x: 20, y: JFSCREEN_HEIGHT-70, width: JFSCREEN_WIDTH-40, height: 40))
        movieStartBtn.layer.borderWidth = 1.0
        movieStartBtn.layer.cornerRadius = 20
        movieStartBtn.layer.borderColor = UIColor.white.cgColor
        movieStartBtn.setTitle("开始体验", for: .normal)
        movieStartBtn.alpha = 0.0
        playerController.view.addSubview(movieStartBtn)
        movieStartBtn.addTarget(self, action: #selector(skipBtnClick), for: .touchUpInside)
        
        UIView.animate(withDuration: 1.0) {
            movieStartBtn.alpha = 1.0
        }
    }
    
    @objc func skipBtnClick() {
        UIView.animate(withDuration: 1, animations: {
            self.alpha = 0
        }) { (finsh) in
            self.removeFromSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    deinit {
        print("deinit")
    }
   

}

extension JFGuidePageView{
    
    /// 添加scrollView
    ///
    /// - Parameter frame: 作为图片的容器
    func addScrollView(frame : CGRect) {
        guideScrollView = UIScrollView.init(frame: frame)
        guideScrollView?.backgroundColor = UIColor.white
        guideScrollView?.contentSize = CGSize.init(width: JFSCREEN_WIDTH * (CGFloat)((imageArray?.count)!), height: JFSCREEN_HEIGHT)
        guideScrollView?.bounces = false
        guideScrollView?.isPagingEnabled = true
        guideScrollView?.showsVerticalScrollIndicator = false
        guideScrollView?.showsHorizontalScrollIndicator = false
        guideScrollView?.delegate = self
        addSubview(guideScrollView!)
        
    }
    
    
    /// 设置图片
    func addImages() {
        
        guard let  imageArray = self.imageArray else {
            return
        }
        
        for i in 0..<imageArray.count {
            let imageView = UIImageView.init(frame: CGRect.init(x: JFSCREEN_WIDTH * CGFloat(i), y: 0, width: JFSCREEN_WIDTH, height: JFSCREEN_HEIGHT))
            //在scrollerView上面加三张图片
            guideScrollView?.addSubview(imageView)
            
            //截取字符串最后三个字符
            let idSring  = (imageArray[i] as NSString).substring(from: imageArray[i].count - 3)
            if idSring == "gif"{
                
                do {
//                    let gif = try UIImage(gifName: "MyImage.gif")
//                    let imageview = UIImageView(gifImage: gif, loopCount: 3) // Will loop 3 times
//                    imageview.frame = view.bounds
//                    view.addSubview(imageview)
                    
                    let gif = try UIImage(gifName: imageArray[i])
                    imageView.setGifImage(gif)
                    
                } catch {
                    print(error)
                }
                
//                let gif = try UIImage(gifName: imageArray[i])
//                imageView.setGifImage(gif)
            }else{
                imageView.image = UIImage.init(named: imageArray[i])
            }
            
            // 在最后一张图片上显示开始体验按钮
            if i == imageArray.count - 1 {
                imageView.isUserInteractionEnabled = true
                let startButton = UIButton.init(frame: CGRect.init(x: JFSCREEN_WIDTH*0.1, y: JFSCREEN_HEIGHT*0.8, width: JFSCREEN_WIDTH*0.8, height: JFSCREEN_HEIGHT*0.08))
                startButton.setTitle("开始体验", for: .normal)
                startButton.setTitleColor(UIColor.white, for: .normal)
                startButton.setBackgroundImage(UIImage.init(named: "guide_btn_bg"), for: .normal)
                startButton.addTarget(self, action: #selector(skipBtnClick), for: .touchUpInside)
                imageView.addSubview(startButton)
            }
        }
        
    }
    
    // 设置引导页上的页面控制器
    func addPageControl() {
        self.imagePageController = UIPageControl.init(frame: CGRect.init(x: 0, y: JFSCREEN_HEIGHT*0.9, width: JFSCREEN_WIDTH, height: JFSCREEN_HEIGHT*0.1))
//        self.imagePageController.currentPage = 0
//        self.imagePageController.numberOfPages = imageArray?.count ?? 0
//        self.imagePageController.pageIndicatorTintColor = UIColor.gray
//        self.imagePageController.currentPageIndicatorTintColor = UIColor.white
        addSubview(self.imagePageController!)
    }
    
    func addSkipButton(isHiddenSkipButton: Bool) {
        if isHiddenSkipButton {
            return
        }
        let skipButton = UIButton.init(frame: CGRect.init(x: JFSCREEN_WIDTH * 0.8, y: JFSCREEN_WIDTH * 0.1, width: 70, height: 35))
        skipButton.setTitle("跳过", for: .normal)
        skipButton.backgroundColor = UIColor.gray
        skipButton.setTitleColor(UIColor.white, for: .normal)
        skipButton.layer.cornerRadius = skipButton.frame.size.height * 0.5
        skipButton.addTarget(self, action: #selector(skipBtnClick), for: .touchUpInside)
        addSubview(skipButton)
        
    }
    
    
}
