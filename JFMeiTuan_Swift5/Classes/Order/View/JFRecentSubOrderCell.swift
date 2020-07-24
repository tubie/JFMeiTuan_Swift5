//
//  JFRecentSubOrderCell.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/8/9.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit

class JFRecentSubOrderCell: UITableViewCell {

    
    @IBOutlet weak var bgContentView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        //给背景色添加阴影
//        bgContentView.layer.shadowOpacity = 0.5
//        bgContentView.layer.shadowPath = UIBezierPath(rect: bgContentView.layer.bounds).cgPath
//
        bgContentView.layer.shadowOffset = CGSize.init(width: JFSCREEN_WIDTH, height: 100)// 设置阴影的偏移量、
        bgContentView.layer.shadowColor = JFStyle.navigarionBarColor().cgColor


    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func cellWithTableView(_ tableView:UITableView) -> JFRecentSubOrderCell {
        
        let JFRecentSubOrderCell:NSString = "JFRecentSubOrderCell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: JFRecentSubOrderCell as String )
        
        if cell == nil {
            
            cell = Bundle.main.loadNibNamed("JFRecentSubOrderCell", owner: nil, options: nil)?.last as? UITableViewCell
        }
        return cell as! JFRecentSubOrderCell
    }
    
}
