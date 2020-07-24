//
//  JFWeakNormalCell.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/8/8.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit

class JFWeakNormalCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func cellWithTableView(_ tableView:UITableView) -> JFWeakNormalCell {
        
        let JFWeakNormalCell:NSString = "JFWeakNormalCell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: JFWeakNormalCell as String )
        
        if cell == nil {
            
            cell = Bundle.main.loadNibNamed("JFWeakNormalCell", owner: nil, options: nil)?.last as? UITableViewCell
        }
        return cell as! JFWeakNormalCell
    }
    
    
}
