//
//  JFMineAcconutCell.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/8/10.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit

class JFMineAcconutCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func cellWithTableView(_ tableView:UITableView) -> JFMineAcconutCell {
        
        let JFMineAcconutCell:NSString = "JFMineAcconutCell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: JFMineAcconutCell as String )
        
        if cell == nil {
            
            cell = Bundle.main.loadNibNamed("JFMineAcconutCell", owner: nil, options: nil)?.last as? UITableViewCell
        }
        return cell as! JFMineAcconutCell
    }
    
}
