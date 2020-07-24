//
//  UIImage+JFExtension.swift
//  JFMeiTuan_Swift
//
//  Created by TuBieBuTu on 2018/8/26.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView{
    
    func JF_Image(imageName:String) {
        if (imageName.hasPrefix("http")) {
            let url  = URL(string: imageName)
            self.kf.setImage(with: url)
        }else{
            self.image = UIImage.init(named: imageName)
        }
    }
   
}
