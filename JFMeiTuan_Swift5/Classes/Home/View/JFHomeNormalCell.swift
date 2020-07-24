//
//  JFHomeNormalCell.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/7/27.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit

class JFHomeNormalCell: UITableViewCell {
    
    /*
     "imageName": "大笑",
     "title": "大笑",
     "type": "喜剧",
     "desTitle": "打车",
     "distance": "5.0km",
     "saleNumber": "50份",
     "price": "￥30",
     */

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var typeLb: UILabel!
    @IBOutlet weak var desTitle: UILabel!
  
    @IBOutlet weak var priceLb: UILabel!
    
    @IBOutlet weak var saleNumberLb: UILabel!
    @IBOutlet weak var distanceLb: UILabel!
    
    
    var model:JFHomeConmonModel?{
        didSet{
            imgView.JF_Image(imageName: (model?.imageName)!)
            titleLb.text = model?.title
            typeLb.text = model?.type
            desTitle.text = model?.desTitle
            priceLb.text = model?.price
            saleNumberLb.text = model?.saleNumber
            distanceLb.text = model?.distance
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
    
    class func cellWithTableView(_ tableView:UITableView) -> JFHomeNormalCell {
        
        let JFHomeNormalCellID:NSString = "JFHomeNormalCellID"
        
        var mineCell = tableView.dequeueReusableCell(withIdentifier: JFHomeNormalCellID as String )
        
        if mineCell == nil {
            
            mineCell = Bundle.main.loadNibNamed("JFHomeNormalCell", owner: nil, options: nil)?.last as? UITableViewCell
        }
        return mineCell as! JFHomeNormalCell
    }
    
    
}
