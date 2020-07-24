//
//  JFRecentViewOrderCell.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/8/9.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit

class JFRecentViewOrderCell: UITableViewCell,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var titleClassLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.rowHeight = 110;
        tableView.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func cellWithTableView(_ tableView:UITableView) -> JFRecentViewOrderCell {
        
        let JFRecentViewOrderCell:NSString = "JFRecentViewOrderCell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: JFRecentViewOrderCell as String )
        
        if cell == nil {
            
            cell = Bundle.main.loadNibNamed("JFRecentViewOrderCell", owner: nil, options: nil)?.last as? UITableViewCell
        }
        return cell as! JFRecentViewOrderCell
    }
    
    /************************************************************************************
     tableView delegate
     ************************************************************************************/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 2
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell:JFNormalOrderCell  = JFNormalOrderCell.cellWithTableView(tableView)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
        
    }
    
}
