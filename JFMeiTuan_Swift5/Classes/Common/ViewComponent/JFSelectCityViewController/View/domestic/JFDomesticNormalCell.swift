//
//  JFDomesticNormalCell.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/8/27.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit

class JFDomesticNormalCell: UITableViewCell {

    @IBOutlet weak var bottomLineView: UIView!
    @IBOutlet weak var cityLb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    class func cellWithTableView(_ tableView:UITableView) -> JFDomesticNormalCell {
        
        let JFDomesticNormalCellID:NSString = "JFDomesticNormalCellID"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: JFDomesticNormalCellID as String )
        
        if cell == nil {
            
            cell = Bundle.main.loadNibNamed("JFDomesticNormalCell", owner: nil, options: nil)?.last as? UITableViewCell
        }
        return cell as! JFDomesticNormalCell
    }
    
}
