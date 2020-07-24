//
//  JFNormalOrderCell.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/8/9.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit

class JFNormalOrderCell: UITableViewCell {

    @IBOutlet weak var desAddressLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var normalImageView: UIImageView!
    
    
    
    var nearModel : JFNearModel?{
        didSet{
            normalImageView.JF_Image(imageName: (nearModel?.imageName)!)
            moneyLabel.text = nearModel?.money
            addressLabel.text = nearModel?.adress
            distanceLabel.text = nearModel?.distance
            titleLabel.text = nearModel?.desTitle
            desAddressLabel.text = nearModel?.adressDetail


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
    
    class func cellWithTableView(_ tableView:UITableView) -> JFNormalOrderCell {
        
        let JFNormalOrderCell:NSString = "JFNormalOrderCell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: JFNormalOrderCell as String )
        
        if cell == nil {
            
            cell = Bundle.main.loadNibNamed("JFNormalOrderCell", owner: nil, options: nil)?.last as? UITableViewCell
        }
        return cell as! JFNormalOrderCell
    }
    
}
