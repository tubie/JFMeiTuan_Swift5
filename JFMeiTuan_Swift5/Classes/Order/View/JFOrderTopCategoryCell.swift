//
//  JFOrderTopCategoryCell.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/8/9.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit

class JFOrderTopCategoryCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func cellWithTableView(_ tableView:UITableView) -> JFOrderTopCategoryCell {
        
        let JFOrderTopCategoryCell:NSString = "JFOrderTopCategoryCell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: JFOrderTopCategoryCell as String )
        
        if cell == nil {
            
            cell = Bundle.main.loadNibNamed("JFOrderTopCategoryCell", owner: nil, options: nil)?.last as? UITableViewCell
        }
        return cell as! JFOrderTopCategoryCell
    }
    
}
