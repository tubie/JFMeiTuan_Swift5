//
//  JFCommonModel.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/8/16.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit
import ObjectMapper

class JFCommonModel: Mappable {
    var imageName: String?
    var desTitle : String?
    
    init(){
    }
    
    required init?(map: Map) {
    }
    
    // Mappable 一一映射
    func mapping(map: Map) {
        imageName    <- map["imageName"]
        desTitle      <- map["desTitle"]
        
    }
}
