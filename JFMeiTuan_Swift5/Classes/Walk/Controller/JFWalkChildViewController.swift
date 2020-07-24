//
//  JFWalkChildViewController.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/8/8.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit

class JFWalkChildViewController: JFBaseViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.separatorStyle = .none
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 30
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        
        let type  = indexPath.row % 2
        if type == 0 {
            let cell:JFWeakNormalCell  = JFWeakNormalCell.cellWithTableView(tableView)
            return cell

        }else{
            let cell:JFWalkVideoCell  = JFWalkVideoCell.cellWithTableView(tableView)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let type  = indexPath.row % 2
        if type == 0 {
            return 120
            
        }else{
            return 200
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
