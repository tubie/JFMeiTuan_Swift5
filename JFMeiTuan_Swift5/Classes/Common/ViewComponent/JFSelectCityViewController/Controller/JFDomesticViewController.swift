//
//  JFDomesticViewController.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/8/27.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit

class JFDomesticViewController: JFBaseViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        initData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /// 初始化数据
    func initData()  {
        
    }

}




// MARK: -
extension JFDomesticViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        if section == 1 || section == 0 {
            return 1
        }
        return 10
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        if indexPath.section == 0 {
            let cell:JFDomesticLoctionCityCell  = JFDomesticLoctionCityCell.cellWithTableView(tableView)
            return cell
        }else if indexPath.section == 1 {
            let cell:JFDomesticHotCityCell  = JFDomesticHotCityCell.cellWithTableView(tableView)
            return cell
        }
        let cell:JFDomesticNormalCell  = JFDomesticNormalCell.cellWithTableView(tableView)
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 60
        }else if indexPath.section == 1 {
            return 200
        }
        return 40
    }
    
}
