//
//  JFBaseTabBarController.swift
//  JFMeiTuan_Swift
//
//  Created by linjianfang on 2017/8/29.
//  Copyright © 2017年 linjianfang. All rights reserved.
//  测试

import UIKit

class JFBaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.isTranslucent = false//tabbar不透明
        setChildrenControllers()

    }
    
    /*
     func initControllers(){
     let JFBaseHomeNav = JFBaseNacigationController.init(rootViewController: JFHomeViewController())
     let JFBaseNearNav = JFBaseNacigationController.init(rootViewController: JFNearViewController())
     let JFBaseWalkNav = JFBaseNacigationController.init(rootViewController: JFwalkViewController())
     let JFBaseOrderNav = JFBaseNacigationController.init(rootViewController: JFOrderViewController())
     let JFBaseMeNav = JFBaseNacigationController.init(rootViewController: JFMineViewController())
     
     self.viewControllers = [JFBaseHomeNav,JFBaseNearNav,JFBaseWalkNav,JFBaseOrderNav,JFBaseMeNav]
     self.tabBar.isTranslucent = false//tabbar不透明
     
     let tabbarItem0 = self.tabBar.items?[0]
     tabbarItem0?.image = UIImage.init(named: "pfb_tabbar_homepage")
     tabbarItem0?.selectedImage = UIImage.init(named: "pfb_tabbar_homepage_selected")
     tabbarItem0?.title = "首页";
     tabbarItem0?.titlePositionAdjustment = UIOffsetMake(0,-4)
     
     let tabbarItem1 = self.tabBar.items?[1]
     tabbarItem1?.image = UIImage.init(named: "pfb_tabbar_merchant")
     tabbarItem1?.selectedImage = UIImage.init(named: "pfb_tabbar_merchant_selected")
     tabbarItem1?.title = "附近";
     tabbarItem1?.titlePositionAdjustment = UIOffsetMake(0,-4)
     
     let tabbarItem2 = self.tabBar.items?[2]
     tabbarItem2?.image = UIImage.init(named: "pfb_tabbar_discover")
     tabbarItem2?.selectedImage = UIImage.init(named: "pfb_tabbar_discover_selected")
     tabbarItem2?.title = "发现";
     tabbarItem2?.titlePositionAdjustment = UIOffsetMake(0,-4)
     
     let tabbarItem3 = self.tabBar.items?[3]
     tabbarItem3?.image = UIImage.init(named: "pfb_tabbar_order")
     tabbarItem3?.selectedImage = UIImage.init(named: "pfb_tabbar_order_selected")
     tabbarItem3?.title = "订单";
     tabbarItem3?.titlePositionAdjustment = UIOffsetMake(0,-4)
     
     let tabbarItem4 = self.tabBar.items?[4]
     tabbarItem4?.image = UIImage.init(named: "pfb_tabbar_mine")
     tabbarItem4?.selectedImage = UIImage.init(named: "pfb_tabbar_order_selected")
     tabbarItem4?.title = "我的";
     tabbarItem4?.titlePositionAdjustment = UIOffsetMake(0,-4)
     
     
     //选中个非选中的字体颜色
     UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.gray], for:.normal)
     UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: JFStyle.navigarionBarColor()], for: .selected)
     
     }
     
     */
    

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

extension JFBaseTabBarController{
    
    fileprivate func setChildrenControllers() {
        
        let  tabBarArr   = JFStyle.getJsonWithName(name: "main")
        
        var arrVC  = [UIViewController]()
        for dict in tabBarArr as Array {
            arrVC.append(childrenController(dict: dict as! [String : AnyObject]))
        }
        viewControllers = arrVC
    }
    
    //使用字典加载控制器
    fileprivate func childrenController(dict: [String : AnyObject]) -> UIViewController {
        
        //取得内容
        guard let RootVcName = dict["RootVcName"] as? String,
            let TabbarTitle = dict["TabbarTitle"] as? String,
            let NorImgName = dict["NorImgName"] as? String,
            let SellectImgName = dict["SellectImgName"] as? String,
            let RootVc = NSClassFromString(Bundle.main.namespace + "." + RootVcName) as? JFBaseViewController.Type
            else {
                return UIViewController()
        }
        
        //创建控制器视图
        let rootVc = RootVc.init()
        rootVc.title = TabbarTitle
        rootVc.tabBarController?.tabBarItem.title = TabbarTitle
        rootVc.view.backgroundColor = UIColor.white
        
        //设置图片
        rootVc.tabBarItem.image = UIImage(named:NorImgName)
        rootVc.tabBarItem.selectedImage = UIImage(named:SellectImgName)?.withRenderingMode(.alwaysOriginal)

        
        rootVc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .selected)
        rootVc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: JFStyle.navigarionBarColor()], for: .selected)

        rootVc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font:UIFont.systemFont(ofSize: 9.0)], for: .normal)
        
        //实例化导航控制器
        let nav = JFBaseNacigationController(rootViewController: rootVc)
        return nav
    }
    
}

//获取命名空间
extension Bundle{
    // 计算型属性类似于函数，没有参数，有返回值
    var namespace: String{
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}





