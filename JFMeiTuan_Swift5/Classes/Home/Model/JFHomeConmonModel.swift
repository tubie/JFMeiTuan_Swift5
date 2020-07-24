//
//  JFHomeConmonModel.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/7/27.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit
import ObjectMapper

class JFHomeConmonModel: Mappable {
    
    /*
     "imageName": "大笑",
     "title": "大笑",
     "type": "喜剧",
     "desTitle": "打车",
     "distance": "5.0km",
     "saleNumber": "50份",
     "price": "￥30",
     */
    
    var imageName:String?
    var title:String?
    var type:String?
    var desTitle:String?
    var distance:String?
    var saleNumber:String?
    var price:String?
    
    required init?(map: Map) {
        
    }

    init(){
    }
    
    // Mappable 一一映射
    func mapping(map: Map) {
        imageName    <- map["imageName"]
        title        <- map["title"]
        type         <- map["type"]
        desTitle     <- map["desTitle"]
        distance     <- map["distance"]
        saleNumber   <- map["saleNumber"]
        price        <- map["price"]

    }
    
    

}
