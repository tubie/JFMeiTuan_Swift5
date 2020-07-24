//
//  JFMeModel.swift
//  JFMeiTuan_Swift
//
//  Created by linjianfang on 2017/9/4.
//  Copyright © 2017年 linjianfang. All rights reserved.
//

import UIKit
import ObjectMapper

class JFMeModel: Mappable {
    var headImageName : String?
    var type : String?
    var info : String?
    
    
    
    init(){
    }
    
    required init?(map: Map) {
    }
    
    // Mappable 一一映射
    func mapping(map: Map) {
        headImageName    <- map["headImageName"]
        type      <- map["type"]
        info <- map["info"]
        
    }
    
}
