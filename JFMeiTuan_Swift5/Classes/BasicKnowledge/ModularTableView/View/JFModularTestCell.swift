//
//  JFModularTestCell.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/8/24.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit

class JFModularTestCell: UITableViewCell,ModularModellProtocol {

    @IBOutlet weak var desLb: UILabel!
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var iconView: UIImageView!

    
    var model: ModularModel?{
        didSet{
            guard let model = model else { return }
            titleLb.text = model.title
            desLb.text = model.desc
            iconView.image = model.icon
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
