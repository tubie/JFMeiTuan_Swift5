//
//  JFPageMenuViewController.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/7/26.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit
import PagingMenuController


//分页菜单配置
private struct PagingMenuOptions: PagingMenuControllerCustomizable {
    //第1个子视图控制器
    private let viewController1 = JFPageChildFirstViewController.init(nibName: "JFPageChildFirstViewController", bundle: nil)
    //第2个子视图控制器
    private let viewController2 = JFPageChildSecondViewController.init(nibName: "JFPageChildSecondViewController", bundle: nil)


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
    fileprivate struct MenuItem1: MenuItemViewCustomizable {
        //自定义菜单项名称
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "电影"))
        }
    }

    //第2个菜单项
    fileprivate struct MenuItem2: MenuItemViewCustomizable {
        //自定义菜单项名称
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "音乐"))
        }
    }
}

class JFPageMenuViewController: JFBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.green
        title = "分页"
        
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
        
        
        //页面切换响应
//        pagingMenuController.onMove = { state in
//            switch state {
//            case let .willMoveItem(menuItemView, previousMenuItemView):
//                print("--- 标签将要切换 ---")
//                print("老标签：\(previousMenuItemView.titleLabel.text!)")
//                print("新标签：\(menuItemView.titleLabel.text!)")
//            case let .didMoveItem(menuItemView, previousMenuItemView):
//                print("--- 标签切换完毕 ---")
//                print("老标签：\(previousMenuItemView.titleLabel.text!)")
//                print("新标签：\(menuItemView.titleLabel.text!)")
//            case let .willMoveController(menuController, previousMenuController):
//                print("--- 页面将要切换 ---")
//                print("老页面：\(previousMenuController)")
//                print("新页面：\(menuController)")
//            case let .didMoveController(menuController, previousMenuController):
//                print("--- 页面切换完毕 ---")
//                print("老页面：\(previousMenuController)")
//                print("新页面：\(menuController)")
//            case .didScrollStart:
//                print("--- 分页开始左右滑动 ---")
//            case .didScrollEnd:
//                print("--- 分页停止左右滑动 ---")
//            }
//        }
        
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
