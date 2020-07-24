//
//  JFMineViewController.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/7/23.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit
import ObjectMapper

class JFMineViewController: JFBaseViewController ,UITableViewDelegate,UITableViewDataSource,JFMineCellClickDelegate,JFMineTopCategoryCellDelegate{

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "我的"

        tableView.backgroundColor =  JFStyle.navigarionBarColor()
        
        intNav()

        tableView.tableFooterView = UIView.init()
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.allowsSelection = false
        tableView.reloadData()
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension JFMineViewController{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 5;
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        
        switch indexPath.row {
        case 0:
            let cell:JFMineAcconutCell  = JFMineAcconutCell.cellWithTableView(tableView)
            return cell;
        case 1:
            let cell:JFMineTopCategoryCell  = JFMineTopCategoryCell.cellWithTableView(tableView)
            cell.delegate = self
            return cell;
        case 2:
            let cell:JFMineCell  = JFMineCell.cellWithTableView(tableView)
            
            //创建cell的类型
            cell.cellType = MineCellType.mineMoneyeCellType
            
            cell.delegate = self
            
            let jsonData = JFStyle.getJsonWithName(name: "mine")
            
            let modelArray = Mapper<JFCommonModel>().mapArray(JSONArray: jsonData as! [[String : Any]])
            
            cell.modelArray = modelArray as NSArray
            
            cell.cellTitle = "美团钱包"
            return cell;
            
        case 3:
            let cell:JFMineActiveCell  = JFMineActiveCell.cellWithTableView(tableView)
            return cell;
            
            //            let cell:JFCarouseCell  = JFCarouseCell.cellWithTableView(tableView)
            //            cell.imageUrlArray = ["http://pic9.photophoto.cn/20081128/0033033999061521_b.jpg","http://p17.qhimg.com/bdm/1600_900_85/d/_open360/fengjing25/Banff-National-Park-desktopsky-41283.jpg","http://pic23.photophoto.cn/20120505/0034034818753393_b.jpg","http://pic31.nipic.com/20130713/8821914_171955153144_2.jpg"]
            //            return cell
            
        default:
            let cell:JFMineCell  = JFMineCell.cellWithTableView(tableView)
            
            cell.delegate = self
            
            //创建cell的类型
            cell.cellType = MineCellType.mineServiceCellType
            
            let modelArray = Mapper<JFCommonModel>().mapArray(JSONArray: JFStyle.getJsonWithName(name: "mineService") as! [[String : Any]])
            
            cell.modelArray = modelArray as NSArray
            
            cell.cellTitle = "美团服务"
            cell.bottomLineView.isHidden = true
            return cell;
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 120
        case 1:
            return 100
        case 2:
            return 160
        case 3:
            return 100
            
        default:
            return 160
        }
    }
    
    // JFMineCellClickDelegate
    func mineCellClick(mineCellType:MineCellType, index:Int){
        
        if mineCellType == MineCellType.mineServiceCellType {
            JFLog("\(index)")
            
            let VC:JFWebViewController =  JFWebViewController.init()
            VC.urlString = meiTuanUrl
            navigationController?.pushViewController(VC, animated: true)
            
        }else{
            JFLog("\(index)")
            
            let VC:JFWebViewController =  JFWebViewController.init()
            VC.urlString = meiTuanUrl
            navigationController?.pushViewController(VC, animated: true)
            
        }
    }
    // JFMineTopCategoryCellDelegate
    func mineTopCategoryCellClick(index:Int){
//        let VC:JFWebViewController =  JFWebViewController.init()
//        VC.urlString = meiTuanUrl
//        navigationController?.pushViewController(VC, animated: true)
    }


    
}

extension JFMineViewController{
    func intNav() {
        
        self.setupCustomRightWithTitle(navtStyle: navigationBar.whiteStyle,title: "基础", target: self, action: #selector(rightBtnClick))
        
        self.setupCustomLeftWithImage(image: UIImage.init(named: "icon_main_setting-1")!, target: self, action: #selector(leftBtnClick))
    }
    
    @objc func rightBtnClick() {
        let VC:JFBasicKnowledgeListViewController = JFBasicKnowledgeListViewController.init(nibName: "JFBasicKnowledgeListViewController", bundle: nil)
        navigationController?.pushViewController(VC, animated: true)
    }
    
    @objc func leftBtnClick() {
        let VC:JFSettingViewController = JFSettingViewController.init(nibName: "JFSettingViewController", bundle: nil)
        navigationController?.pushViewController(VC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.barTintColor = JFStyle.navigarionBarColor()
        //设置状态栏的颜色
        JFApplication.statusBarStyle = UIStatusBarStyle.lightContent;
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        JFApplication.statusBarStyle = UIStatusBarStyle.default;
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        self.navigationController?.navigationBar.tintColor = UIColor.black


    }
}
