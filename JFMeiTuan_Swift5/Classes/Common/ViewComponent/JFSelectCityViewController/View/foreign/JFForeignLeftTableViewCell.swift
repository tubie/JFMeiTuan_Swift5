//
//  JFForeignLeftTableViewCell.swift
//  JFMeiTuan_Swift
//
//  Created by TuBieBuTu on 2018/9/16.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit

class JFForeignLeftTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func cellWithTableView(_ tableView:UITableView) -> JFForeignLeftTableViewCell {
        
        let JFForeignLeftTableViewCell:NSString = "JFForeignLeftTableViewCell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: JFForeignLeftTableViewCell as String )
        
        if cell == nil {
            
            cell = Bundle.main.loadNibNamed("JFForeignLeftTableViewCell", owner: nil, options: nil)?.last as? UITableViewCell
        }
        return cell as! JFForeignLeftTableViewCell
    }
    
}
