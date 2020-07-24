//
//  JFDomesticHotCitySubCell.swift
//  JFMeiTuan_Swift
//
//  Created by TuBieBuTu on 2018/9/15.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit

class JFDomesticHotCitySubCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    class func cellWithCollectionView(_ collectionView:UICollectionView ,_ indexPath:NSIndexPath) -> JFDomesticHotCitySubCell {
        
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: selectHotCityReuseIdentifierID as  String, for: indexPath as IndexPath) as? JFDomesticHotCitySubCell
        
        if cell == nil {
            cell = Bundle.main.loadNibNamed("JFDomesticHotCitySubCell", owner: nil, options: nil)?.last as? JFDomesticHotCitySubCell
        }
        
        return cell!
        
    }

}
