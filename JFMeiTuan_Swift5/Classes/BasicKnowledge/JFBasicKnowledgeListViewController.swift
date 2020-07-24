//
//  JFBasicKnowledgeListViewController.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/7/24.//
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import Toast_Swift

class JFBasicKnowledgeListViewController: JFBaseViewController,UITableViewDelegate,UITableViewDataSource,NVActivityIndicatorViewable {

    @IBOutlet weak var tableView: UITableView!
    
    var dataArray:NSArray {
        let tmpArray = ["传值","loading....","分页","轮播图","toast",
                        "引导页","模块化tableView","MVVM","视频播放器","城市选择"]
        return tmpArray as NSArray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "基础"
        tableView.rowHeight = 50;
        tableView.tableFooterView = UIView.init()

        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return dataArray.count;
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell  = JFMeCell.CellWithTableView(tableView)
        cell.typeLabel.text = dataArray[indexPath.row] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            let VC = JFSendValueViewController.init(nibName: "JFSendValueViewController", bundle: nil)
            navigationController?.pushViewController(VC, animated: true)
        }else if (indexPath.row == 1){
            //开始loding
            startAnimating()
//            startAnimating(CGSize(width: 200, height: 100), message: "加载中", messageFont: UIFont.systemFont(ofSize: 13), type: NVActivityIndicatorType.ballBeat, color: UIColor.red, padding: 10, displayTimeThreshold: 10, minimumDisplayTime: 20, backgroundColor: UIColor.white, textColor: UIColor.green)
            let time:TimeInterval = TimeInterval(3)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
                //3秒后结束loading
                self.stopAnimating()
            }
            
        }else if (indexPath.row == 2){
            let VC = JFPageMenuViewController.init()
            navigationController?.pushViewController(VC, animated: true)
        }else if (indexPath.row == 3){
            let VC = JFTestCarouseViewController.init(nibName: "JFTestCarouseViewController", bundle: nil)
            navigationController?.pushViewController(VC, animated: true)
        }else if (indexPath.row == 4){
            // basic usage
            
            self.view.makeToast("This is a piece of toast")
            
    
//            self.view.makeToast("This is a piece of toast", duration: 3.0, position: .center)
            
            
//             self.view.makeToast("This is a piece of toast", duration: 2.0, point: self.view.center, title: "Toast Title", image: UIImage(named: "baby_shopinfo_icon_service_tuan_dp-1")) { didTap in
//             if didTap {
//             print("completion from tap")
//             } else {
//             print("completion without tap")
//             }
//             }
            
 
//            self.view.makeToastActivity(.center)
//
//            let time:TimeInterval = TimeInterval(3)
//            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
//                //3秒后结束loading
//                self.view.hideToastActivity()
//            }
            
            
            
            // display any view as toast
//            self.view.showToast(myView)
            
            // immediately hides all toast views in self.view
//            self.view.hideAllToasts()JFTestVC
            
        }else if (indexPath.row == 5){
            let VC = JFGuidePageTestViewController.init(nibName: "JFGuidePageTestViewController", bundle: nil)
            navigationController?.pushViewController(VC, animated: true)
        }else if (indexPath.row == 6){
//            let VC = JFModularTableViewController.init(nibName: "JFModularTableViewController", bundle: nil)
//            navigationController?.pushViewController(VC, animated: true)
            
            let VC = JFTestVC.init()
            navigationController?.pushViewController(VC, animated: true)
        }else if (indexPath.row == 7){
           
        }else if (indexPath.row == 8){
            //视频播放器
            let VC = JFVideoPlayerViewController.init()
            VC.videoUrl = "http://v6-tt.ixigua.com/video/m/2204a583465e5884903806bad27e0573878115a7a810000b1459c06e8a4/?Expires=1535340872&AWSAccessKeyId=qh0h9TdcEMoS2oPj7aKX&Signature=7ebprjLdTKSvBIyDHl0Qtk75Kyo%3D"
            navigationController?.pushViewController(VC, animated: true)
            
        }else if (indexPath.row == 9){
            //城市选择
            
        }
        
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
