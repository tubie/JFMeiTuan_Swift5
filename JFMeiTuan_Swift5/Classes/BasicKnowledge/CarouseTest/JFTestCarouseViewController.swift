//
//  JFTestCarouseViewController.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/8/13.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit

class JFTestCarouseViewController: JFBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "轮播图"

        // Do any additional setup after loading the view.
        
//        let view:JFCarouselView = JFCarouselView.instantiateFromNib()
        
        let carouselView:JFCarouselView = JFCarouselView.init(frame: CGRect(x: 0, y: 100, width: JFSCREEN_WIDTH, height: 100))

//        view.frame = CGRect(x: 0, y: 100, width: JF_SCREEN_WIDTH, height: 100)
        
        
//        let view:JFCarouselView = JFCarouselView.init(frame: CGRect(x: 0, y: 100, width: JF_SCREEN_WIDTH, height: 100))
//        view.frame(frame: CGRect(x: 0, y: 100, width: JF_SCREEN_WIDTH, height: 100))
        
        carouselView.imageUrlArray = ["orderFood","mineActiveBanner","ptm_home_account_background"]
        
        view.addSubview(carouselView)
        
        
        
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
