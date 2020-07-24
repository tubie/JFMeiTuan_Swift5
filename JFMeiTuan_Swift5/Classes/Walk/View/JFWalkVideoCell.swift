//
//  JFWalkVideoCell.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/8/9.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit

class JFWalkVideoCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func cellWithTableView(_ tableView:UITableView) -> JFWalkVideoCell {
        
        let JFWalkVideoCell:NSString = "JFWalkVideoCell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: JFWalkVideoCell as String )
        
        if cell == nil {
            
            cell = Bundle.main.loadNibNamed("JFWalkVideoCell", owner: nil, options: nil)?.last as? UITableViewCell
        }
        return cell as! JFWalkVideoCell
    }
    
}
