//
//  JFSelectCityViewController.swift
//  JFMeiTuan_Swift
//
//  Created by TuBieBuTu on 2018/8/26.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit
import PagingMenuController


//分页菜单配置
private struct PagingMenuOptions: PagingMenuControllerCustomizable {
    //第1个子视图控制器
    private let viewController1 = JFDomesticViewController.init(nibName: "JFDomesticViewController", bundle: nil)
    //第2个子视图控制器
    private let viewController2 = JFInternationalViewController.init(nibName: "JFInternationalViewController", bundle: nil)
    
   
    //组件类型
    fileprivate var componentType: ComponentType {
        return .all(menuOptions: MenuOptions(), pagingControllers: pagingControllers)
    }
    
    //所有子视图控制器
    fileprivate var pagingControllers: [UIViewController] {
        return [viewController1, viewController2]
    }
    
    
    //菜单配置项
    fileprivate struct MenuOptions: MenuViewCustomizable {
        //菜单显示模式
        var displayMode: MenuDisplayMode {
            return .segmentedControl
        }
        //菜单项
        var itemsOptions: [MenuItemViewCustomizable] {
            return [MenuItem1(), MenuItem2()]
        }
    }
    
    //第1个菜单项
    
    /*
     case text(title: MenuItemText)
     case multilineText(title: MenuItemText, description: MenuItemText)
     case image(image: UIImage, selectedImage: UIImage?)
     case custom(view: UIView)
     */
    fileprivate struct MenuItem1: MenuItemViewCustomizable {
        //自定义菜单项名称
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "国内" ))
        }
    }
    
    //第2个菜单项
    fileprivate struct MenuItem2: MenuItemViewCustomizable {
        //自定义菜单项名称
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "国际"))
        }
    }
 
}


class JFSelectCityViewController: JFBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        initNav()
        
        //分页菜单配置
        let options = PagingMenuOptions()
        //分页菜单控制器初始化
        let pagingMenuController = PagingMenuController(options: options)
        //        //分页菜单控制器尺寸设置
        //        pagingMenuController.view.frame.origin.y += 64
        //        pagingMenuController.view.frame.size.height -= 64
        
        //建立父子关系
        addChild(pagingMenuController)
        //分页菜单控制器视图添加到当前视图中
        view.addSubview(pagingMenuController.view)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension JFSelectCityViewController{
    func initNav()  {
        self.title = "选择城市"
        self.setupCustomLeftWithImage(image: UIImage.init(named: "baby_pintuan_close")!, target: self, action: #selector(leftBtnClick))
    }
    @objc func leftBtnClick()  {
        self.dismiss(animated: true, completion: nil)
    }
}
