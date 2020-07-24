//
//  JFMineActiveCell.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/8/10.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit

class JFMineActiveCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func cellWithTableView(_ tableView:UITableView) -> JFMineActiveCell {
        
        let JFMineActiveCell:NSString = "JFMineActiveCell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: JFMineActiveCell as String )
        
        if cell == nil {
            
            cell = Bundle.main.loadNibNamed("JFMineActiveCell", owner: nil, options: nil)?.last as? UITableViewCell
        }
        return cell as! JFMineActiveCell
    }
    
}
