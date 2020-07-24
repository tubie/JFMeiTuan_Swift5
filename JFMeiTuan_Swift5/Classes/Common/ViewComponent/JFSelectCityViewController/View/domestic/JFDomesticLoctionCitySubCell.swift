//
//  JFDomesticLoctionCitySubCell.swift
//  JFMeiTuan_Swift
//
//  Created by TuBieBuTu on 2018/9/16.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit

class JFDomesticLoctionCitySubCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class func cellWithCollectionView(_ collectionView:UICollectionView ,_ indexPath:NSIndexPath) -> JFDomesticLoctionCitySubCell {
        
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: selectLoctionCityReuseIdentifierID as  String, for: indexPath as IndexPath) as? JFDomesticLoctionCitySubCell
        
        if cell == nil {
            cell = Bundle.main.loadNibNamed("JFDomesticLoctionCitySubCell", owner: nil, options: nil)?.last as? JFDomesticLoctionCitySubCell
        }
        
        return cell!
        
    }

}
