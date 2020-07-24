//
//  JFMineCollectionCell.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/7/23.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit

class JFMineCollectionCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var desLabel: UILabel!
    
    var commonModel : JFCommonModel?{
        didSet{
            //重写set方法
            imageView.image = UIImage.init(named:  (commonModel?.imageName)!)
            desLabel.text = commonModel?.desTitle
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class func cellWithCollectionView(_ collectionView:UICollectionView ,_ indexPath:NSIndexPath) -> JFMineCollectionCell {
        
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierID as  String, for: indexPath as IndexPath) as? JFMineCollectionCell
        
        if cell == nil {
            cell = Bundle.main.loadNibNamed("JFMineCollectionCell", owner: nil, options: nil)?.last as? JFMineCollectionCell
        }
        
        return cell!
        
    }

}
