//
//  JFGuidePageTestViewController.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/8/23.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit

class JFGuidePageTestViewController: JFBaseViewController {

  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.guideImage6
    }
    
    
    @IBAction func imageBtnClick(_ sender: Any) {
        
        let imageNameArray: [String] = ["lead01", "lead02", "lead03"]
        let guideView = JFGuidePageView.init(imageNameArray: imageNameArray, isHideSkipBtn: false)
        JFKeyWindow?.rootViewController?.view.addSubview(guideView)
        
        
    }
    @IBAction func gifBtnClick(_ sender: Any) {
        
        let imageNameArray: [String] = ["guideImage6.gif", "guideImage7.gif", "guideImage8.gif"]
        let guideView = JFGuidePageView.init(imageNameArray: imageNameArray, isHideSkipBtn: false)
        JFKeyWindow?.rootViewController?.view.addSubview(guideView)
        
        
        
    }
    @IBAction func videoBtnClick(_ sender: Any) {
        
        //添加视频引导页
        let urlStr = Bundle.main.path(forResource: "qidong.mp4", ofType: nil)
        let videoUrl = NSURL.fileURL(withPath: urlStr!)
        let guideView = JFGuidePageView.init(videoUrl: videoUrl, isHideSkipBtn: false)
        JFKeyWindow?.rootViewController?.view.addSubview(guideView)
        
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
