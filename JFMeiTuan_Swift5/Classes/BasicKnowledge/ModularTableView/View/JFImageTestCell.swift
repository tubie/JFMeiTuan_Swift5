//
//  JFImageTestCell.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/8/23.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit

class JFImageTestCell: UITableViewCell {

    @IBOutlet weak var bigImageV: UIImageView!
    
    
    var model: ModularModel?{
        didSet{
            guard let model = model else { return }
            bigImageV.image = model.icon
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

}
