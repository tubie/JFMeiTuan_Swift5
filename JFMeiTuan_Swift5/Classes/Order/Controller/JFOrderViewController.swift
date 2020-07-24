//
//  JFOrderViewController.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/8/9.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit

class JFOrderViewController: JFBaseViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "我的订单"

        // Do any additional setup after loading the view.
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 4
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        switch indexPath.row {
        case 0:
            let cell:JFOrderTopCategoryCell  = JFOrderTopCategoryCell.cellWithTableView(tableView)
            return cell
        case 1:
            let cell:JFRecentOrderCell  = JFRecentOrderCell.cellWithTableView(tableView)
            return cell
        case 2:
            let cell:JFRecentViewOrderCell  = JFRecentViewOrderCell.cellWithTableView(tableView)
            cell.titleClassLabel.text = "最近收藏"
            return cell
        default:
            let cell:JFRecentViewOrderCell  = JFRecentViewOrderCell.cellWithTableView(tableView)
            cell.titleClassLabel.text = "最近浏览"
            return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 80
        case 1:
            return 370
        case 2:
            return 290
        default:
            return 290
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
        let VC:JFWebViewController =  JFWebViewController.init()
        VC.urlString = myPageUrl
        navigationController?.pushViewController(VC, animated: true)
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
