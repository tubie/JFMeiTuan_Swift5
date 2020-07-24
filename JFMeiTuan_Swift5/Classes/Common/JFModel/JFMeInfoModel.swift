//
//  JFMeInfoModel.swift
//  JFMeiTuan_Swift
//
//  Created by linjianfang on 2017/9/4.
//  Copyright © 2017年 linjianfang. All rights reserved.
//

import UIKit
import ObjectMapper

class JFMeInfoModel: Mappable {
    var acconnt : String?
    var info : String?
    var headImageName : String?
    
    
    
    init(){
    }
    
    required init?(map: Map) {
    }
    
    // Mappable 一一映射
    func mapping(map: Map) {
        acconnt    <- map["acconnt"]
        info      <- map["info"]
        headImageName <- map["headImageName"]
        
    }

}
