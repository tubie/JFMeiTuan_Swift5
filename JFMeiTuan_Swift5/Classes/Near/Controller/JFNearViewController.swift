//
//  JFNearViewController.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/8/9.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit
import ObjectMapper

class JFNearViewController: JFBaseViewController,UITableViewDataSource,UITableViewDelegate,JFNearClassHearderViewDelegate,JFCarouseCellDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var dataArray:NSArray  = []
    
    var currentIndex:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "附近"
        //初始化数据 0
        dataArray = nearDataSource(index: 0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension JFNearViewController{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if section == 0 {
            return 1
        }
        return dataArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        if indexPath.section == 0 {
            let cell:JFCarouseCell  = JFCarouseCell.cellWithTableView(tableView)
            cell.imageUrlArray = ["http://05.imgmini.eastday.com/mobile/20171121/20171121164242_1698caeb8ac9a69306146a88958e1107_1.jpeg","http://01.imgmini.eastday.com/mobile/20170914/c85689ce514e2e8a8d59c698d950711b.jpeg","http://pic.5club.cctv.cn/photoAlbum/page/performance/img/2017/10/16/1508137907928_884.jpg","http://img.mp.itc.cn/upload/20161226/8355c04244844b4ca228f03cfa839139_th.jpg"]
            cell.deleagte = self
            return cell
        }
        let cell:JFNormalOrderCell  = JFNormalOrderCell.cellWithTableView(tableView)
        
        cell.nearModel = (dataArray[indexPath.row] as! JFNearModel)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return UIView.init()
        }else{
            let headView:JFNearClassHearderView  = JFNearClassHearderView.headViewWithTableView(tableView)
            headView.delegate = self
            
            headView.currentBtnStatus(index: currentIndex)
            return headView
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return CGFloat(JFEmptyHeaderViewHeight)
        }else{
            return 60
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
    }
    
    
    func nearHearderViewClickAtIndex(index:Int, nearClassHearderView:JFNearClassHearderView){
        //因为当前的 button的tag 是1，2，3，4，5 最小值是1
       currentIndex = index - 1
       dataArray = nearDataSource(index: currentIndex)
       tableView.reloadData()
    }
    
    /// 轮播图的代理
    /// delegate
    /// - Parameter index: 点击的小标
    func carouseCellClickAtIndex(index:Int){
        JFLog("\(index)")
        
    }
}

extension JFNearViewController{
    func nearDataSource(index:Int) -> NSArray {
        
        switch index {
        case 0:
            let jsonArray:NSArray = JFStyle.getJsonWithName(name: "nearFood")
            
            let modelArray = Mapper<JFNearModel>().mapArray(JSONArray: jsonArray as! [[String : Any]])
            return modelArray as NSArray
        case 1:
            let jsonArray:NSArray = JFStyle.getJsonWithName(name: "nearLive")
            
            let modelArray = Mapper<JFNearModel>().mapArray(JSONArray: jsonArray as! [[String : Any]])
            return modelArray as NSArray
        case 2:
            let jsonArray:NSArray = JFStyle.getJsonWithName(name: "nearPlay")
            
            let modelArray = Mapper<JFNearModel>().mapArray(JSONArray: jsonArray as! [[String : Any]])
            return modelArray as NSArray
        case 3:
            let jsonArray:NSArray = JFStyle.getJsonWithName(name: "nearHotel")
            
            let modelArray = Mapper<JFNearModel>().mapArray(JSONArray: jsonArray as! [[String : Any]])
            return modelArray as NSArray
        default:
            let jsonArray:NSArray = JFStyle.getJsonWithName(name: "nearAll")
            
            let modelArray = Mapper<JFNearModel>().mapArray(JSONArray: jsonArray as! [[String : Any]])
            return modelArray as NSArray
        }
       
    }
}
