//
//  JFMeListCellModel.swift
//  JFMeiTuan_Swift
//
//  Created by linjianfang on 2017/8/30.
//  Copyright © 2017年 linjianfang. All rights reserved.
//

import UIKit
import ObjectMapper
//继承 Mappable
class JFMeListCellModel: Mappable {
    var buttonImageName : String?
    var buttonTitle : String?
    
    
    init(){
    }
    
    required init?(map: Map) {
    }
    
    // Mappable 一一映射
    func mapping(map: Map) {
        buttonImageName    <- map["buttonImageName"]
        buttonTitle      <- map["buttonTitle"]
       
    }

}

