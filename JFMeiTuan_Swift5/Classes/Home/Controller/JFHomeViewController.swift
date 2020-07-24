//
//  JFHomeViewController.swift
//  JFMeiTuan_Swift
//
//  Created by linjianfang on 2017/8/29.
//  Copyright © 2017年 linjianfang. All rights reserved.
//

import UIKit
import SnapKit
import ObjectMapper

let ID  = "cell"
let headerCellID  = "headerCellID"
let ListCellID  = "ListCellID"
class JFHomeViewController: JFBaseViewController,UITableViewDataSource,UITableViewDelegate,UISearchResultsUpdating,UISearchBarDelegate {

    var tableView  = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //初始化导航栏
        initNav()
        
        //初始化视图
        initView()
        
        //初始化数据
        initData()
    }
    // 懒加载
    lazy var normalDataArray: [JFHomeConmonModel] = {
      
        let jsonArray:NSArray = JFStyle.getJsonWithName(name: "homeNormal")
        
        let modelArray = Mapper<JFHomeConmonModel>().mapArray(JSONArray: jsonArray as! [[String : Any]])
        // 返回
        return modelArray
    }()
    
    //初始化数据
    func initData(){
        JFBaseNetwork.shareInstance.initData()
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension JFHomeViewController{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (normalDataArray.count + 5)
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        switch indexPath.row {
        case 0:
            let cell:JFCarouseCell  = JFCarouseCell.cellWithTableView(tableView)
            cell.imageUrlArray = ["http://pic9.photophoto.cn/20081128/0033033999061521_b.jpg","http://p17.qhimg.com/bdm/1600_900_85/d/_open360/fengjing25/Banff-National-Park-desktopsky-41283.jpg","http://pic23.photophoto.cn/20120505/0034034818753393_b.jpg","http://pic31.nipic.com/20130713/8821914_171955153144_2.jpg"]
            return cell
        case 1:

            let cell:JFHomeTopCategoryCell  = JFHomeTopCategoryCell.cellWithTableView(tableView)
            
            let jsonArray:NSArray = JFStyle.getJsonWithName(name: "homeTopCategoryCell")
            
            let modelArray = Mapper<JFCommonModel>().mapArray(JSONArray: jsonArray as! [[String : Any]])
            cell.modelArray = modelArray
            
            return cell
        case 2:
            let cell:JFHomeClassCell  = JFHomeClassCell.cellWithTableView(tableView)
            
            let jsonArray:NSArray = JFStyle.getJsonWithName(name: "homeClass")
            
            let modelArray = Mapper<JFCommonModel>().mapArray(JSONArray: jsonArray as! [[String : Any]])
            cell.modelArray = modelArray
            
            return cell
        case 3:
            let cell:JFHomeActiveCell  = JFHomeActiveCell.cellWithTableView(tableView)
            cell.imageName = "http://img.mp.sohu.com/upload/20170520/e7700e6afddf4438b4908233ca981a6e_th.png"
            return cell
        case 4:
            let cell:JFHomeFeaturesCell  = JFHomeFeaturesCell.cellWithTableView(tableView)
            return cell
            
        default:
            let cell:JFHomeNormalCell  = JFHomeNormalCell.cellWithTableView(tableView)
            let jsonArray:NSArray = JFStyle.getJsonWithName(name: "homeNormal")
            
            let modelArray = Mapper<JFHomeConmonModel>().mapArray(JSONArray: jsonArray as! [[String : Any]])
            
            cell.model = modelArray[indexPath.row - 5]
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 120
        case 1:
            return 100
        case 2:
            return 140
        case 3:
            return 200
        case 4:
            return 200
        default:
            return 110
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
    }

}

extension JFHomeViewController{
    
    func initNav() {
       
        //导航栏左边的按钮
        self.setupCustomLeftWithTitle(title: "上海", target: self, action:#selector(leftClick))
        
        //导航栏右边的按钮
        self.setupCustomRightWithImage(image: UIImage.init(named: "beauty_btn_play")!, target: self, action: #selector(rightClick))
        
        let searchResultVC  = JFSearchResultViewController.init(nibName: "JFSearchViewController", bundle: nil)
        
        let VC = UISearchController(searchResultsController: searchResultVC)
        VC.searchResultsUpdater = self
        VC.searchBar.delegate = self
        VC.hidesNavigationBarDuringPresentation = true
        VC.dimsBackgroundDuringPresentation = true
        VC.searchBar.searchBarStyle = .default
        VC.searchBar.sizeToFit()
        navigationItem.titleView = VC.searchBar
        
    }
    
    @objc func leftClick() {
        let VC =  JFSelectCityViewController.init()

        let nav =  JFBaseNacigationController.init(rootViewController: VC)
        navigationController?.present(nav, animated: true, completion: nil)
        
    }
    
    @objc func rightClick() {
        
    }
    
    public func updateSearchResults(for searchController: UISearchController){
        
    }
    
    
    //初始化视图
    func initView() {
        tableView = UITableView(frame :.zero, style:.plain)
        //设置tableView在拖拽tabelView的时候隐藏键盘
        tableView.keyboardDismissMode = .onDrag
        view.addSubview(tableView)
        
        //用snapkit布局
        tableView.snp.makeConstraints { (make) in
            make.width.height.equalToSuperview()
            make.top.equalToSuperview()
        }
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        
        
        let imageView =  UIImageView.init(frame: CGRect.init(x: 100, y: 100, width: 36, height: 36))
        
        let tmpArray:NSMutableArray = []
        for index in 0...14 {
            let image = UIImage.init(named: "icon_voucher_redPackage_animation1\(index+1)")
            tmpArray.add(image as Any)
        }
        
        imageView.animationImages = tmpArray as? [UIImage]
        imageView.startAnimating()
        
        view.addSubview(imageView)
    }
    
    
}



