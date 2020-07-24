//
//  JFwalkViewController.swift
//  JFMeiTuan_Swift
//
//  Created by linjianfang on 2017/8/29.
//  Copyright © 2017年 linjianfang. All rights reserved.
//

import UIKit
import PagingMenuController


//分页菜单配置
private struct PagingMenuOptions: PagingMenuControllerCustomizable {
    //第1个子视图控制器
    private let viewController1 = JFWalkChildViewController.init(nibName: "JFWalkChildViewController", bundle: nil)
    //第2个子视图控制器
    private let viewController2 = JFWalkChildViewController.init(nibName: "JFWalkChildViewController", bundle: nil)
    
    private let viewController3 = JFWalkChildViewController.init(nibName: "JFWalkChildViewController", bundle: nil)

    private let viewController4 = JFWalkChildViewController.init(nibName: "JFWalkChildViewController", bundle: nil)

    private let viewController5 = JFWalkChildViewController.init(nibName: "JFWalkChildViewController", bundle: nil)

    private let viewController6 = JFWalkChildViewController.init(nibName: "JFWalkChildViewController", bundle: nil)

    private let viewController7 = JFWalkChildViewController.init(nibName: "JFWalkChildViewController", bundle: nil)


    
    //组件类型
    fileprivate var componentType: ComponentType {
        return .all(menuOptions: MenuOptions(), pagingControllers: pagingControllers)
    }
    
    //所有子视图控制器
    fileprivate var pagingControllers: [UIViewController] {
        return [viewController1, viewController2, viewController3, viewController4, viewController5, viewController6, viewController7]
    }
    
    
    //菜单配置项
    fileprivate struct MenuOptions: MenuViewCustomizable {
        //菜单显示模式
        var displayMode: MenuDisplayMode {
            return .segmentedControl
        }
        //菜单项
        var itemsOptions: [MenuItemViewCustomizable] {
            return [MenuItem1(), MenuItem2(), MenuItem3(), MenuItem4(), MenuItem5(), MenuItem6(), MenuItem7()]
        }
    }
    
    //第1个菜单项
    fileprivate struct MenuItem1: MenuItemViewCustomizable {
        //自定义菜单项名称
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "精选" ))
        }
    }
    
    //第2个菜单项
    fileprivate struct MenuItem2: MenuItemViewCustomizable {
        //自定义菜单项名称
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "关注"))
        }
    }
    
    
 
    //第2个菜单项
    fileprivate struct MenuItem3: MenuItemViewCustomizable {
        //自定义菜单项名称
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "美食"))
        }
    }
    //第2个菜单项
    fileprivate struct MenuItem4: MenuItemViewCustomizable {
        //自定义菜单项名称
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "去浪"))
        }
    }
    //第2个菜单项
    fileprivate struct MenuItem5: MenuItemViewCustomizable {
        //自定义菜单项名称
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "生活"))
        }
    }
    //第2个菜单项
    fileprivate struct MenuItem6: MenuItemViewCustomizable {
        //自定义菜单项名称
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "变美"))
        }
    }
    
    //第2个菜单项
    fileprivate struct MenuItem7: MenuItemViewCustomizable {
        //自定义菜单项名称
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "电影"))
        }
    }
}


class JFwalkViewController: JFBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = "发现"
        self.view.backgroundColor = UIColor.white
        
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
