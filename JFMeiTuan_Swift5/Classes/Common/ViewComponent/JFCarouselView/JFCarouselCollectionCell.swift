//
//  JFCarouselCollectionCell.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/8/13.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit
import Kingfisher
class JFCarouselCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!

    
    var imageUrlStr: String?{
        didSet{
            imageView.JF_Image(imageName: imageUrlStr!)
        }
    }
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    class func cellWithCollectionView(_ collectionView:UICollectionView ,_ indexPath:NSIndexPath) -> JFCarouselCollectionCell {
        
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: carouselCellCollectionReuseIdentifierID as  String, for: indexPath as IndexPath) as? JFCarouselCollectionCell
        
        if cell == nil {
            cell = Bundle.main.loadNibNamed("JFClassCollectionCell", owner: nil, options: nil)?.last as? JFCarouselCollectionCell
        }
        
        return cell!
        
    }
    

}
