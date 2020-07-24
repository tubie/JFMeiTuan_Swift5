//
//  JFTopCategoryCollectionCell.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/8/13.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit

class JFHomeTopCategoryCollectionCell: UICollectionViewCell {

    @IBOutlet weak var desLb: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var model:JFCommonModel?{
        didSet{
            //重写set方法
            imgView.image = UIImage.init(named:  (model?.imageName)!)
            desLb.text = model?.desTitle
        }
    }
    

    class func cellWithCollectionView(_ collectionView:UICollectionView ,_ indexPath:NSIndexPath) -> JFHomeTopCategoryCollectionCell {
        
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: homeTopCellCollectionReuseIdentifierID as  String, for: indexPath as IndexPath) as? JFHomeTopCategoryCollectionCell
        
        if cell == nil {
            cell = Bundle.main.loadNibNamed("JFHomeTopCategoryCollectionCell", owner: nil, options: nil)?.last as? JFHomeTopCategoryCollectionCell
        }
        
        return cell!
        
    }
}
