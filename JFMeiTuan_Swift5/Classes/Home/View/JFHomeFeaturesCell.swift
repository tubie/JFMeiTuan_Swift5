//
//  JFHomeFeaturesCell.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/8/10.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit

class JFHomeFeaturesCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func cellWithTableView(_ tableView:UITableView) -> JFHomeFeaturesCell {
        
        let JFHomeFeaturesCell:NSString = "JFHomeFeaturesCell"
        
        var mineCell = tableView.dequeueReusableCell(withIdentifier: JFHomeFeaturesCell as String )
        
        if mineCell == nil {
            
            mineCell = Bundle.main.loadNibNamed("JFHomeFeaturesCell", owner: nil, options: nil)?.last as? UITableViewCell
        }
        return mineCell as! JFHomeFeaturesCell
    }
    
}
