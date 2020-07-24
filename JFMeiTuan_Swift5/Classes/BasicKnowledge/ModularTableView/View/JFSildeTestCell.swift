//
//  JFSildeTestCell.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/8/24.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit

class JFSildeTestCell: UITableViewCell {

    @IBOutlet weak var slide: UISlider!
    @IBOutlet weak var maxLb: UILabel!
    @IBOutlet weak var minLb: UILabel!
    
    
    var model: ModularModel?{
        didSet{
            guard let model = model else { return }
            minLb.text = "\(model.min)"
            maxLb.text = "\(model.max)"
            slide.minimumValue = Float(model.min)
            slide.maximumValue = Float(model.max)
            slide.value = Float(model.current)
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
