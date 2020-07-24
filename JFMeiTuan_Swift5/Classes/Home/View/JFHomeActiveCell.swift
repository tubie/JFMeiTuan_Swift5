//
//  JFHomeActiveCell.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/8/10.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit

class JFHomeActiveCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    
    var imageName:String?{
        didSet{
            imgView.JF_Image(imageName: imageName!)

        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func cellWithTableView(_ tableView:UITableView) -> JFHomeActiveCell {
        
        let JFHomeActiveCell:NSString = "JFHomeActiveCell"
        
        var mineCell = tableView.dequeueReusableCell(withIdentifier: JFHomeActiveCell as String )
        
        if mineCell == nil {
            
            mineCell = Bundle.main.loadNibNamed("JFHomeActiveCell", owner: nil, options: nil)?.last as? UITableViewCell
        }
        return mineCell as! JFHomeActiveCell
    }
    
}
