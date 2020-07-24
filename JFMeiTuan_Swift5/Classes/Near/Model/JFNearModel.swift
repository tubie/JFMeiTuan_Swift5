//
//  JFNearModel.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/8/20.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit
import ObjectMapper

/*
 
 "imageName": "大笑",
 "desTitle": "海鲜盛宴",
 "adress": "张江",
 "adressDetail": "长泰",
 "distance": "3.5km",
 "money": "人均￥300"
 */

class JFNearModel:Mappable {
    var imageName : String?
    var desTitle : String?
    var adress : String?
    var adressDetail : String?
    var distance : String?
    var money : String?


    
    
    
    init(){
    }
    
    required init?(map: Map) {
    }
    
    // Mappable 一一映射
    func mapping(map: Map) {
        imageName    <- map["imageName"]
        desTitle    <- map["desTitle"]
        adress    <- map["adress"]
        adressDetail    <- map["adressDetail"]
        distance    <- map["distance"]
        money    <- map["money"]
    }
}

