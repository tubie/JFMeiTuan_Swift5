//
//  ModularModel.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/8/23.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import Foundation
import UIKit

struct ModularModel {
    var type:Int
    var icon:UIImage?
    var title:String?
    var desc:String?
    
    //声明一个闭包
    var selectCell:(()->())?
    
    //闭包作为参数
    init(normalWithIcon icon:UIImage?, title:String,description:String, selectCell:@escaping ()->()) {
        //type用来 识别返回的个cell
        self.type = 0
        self.icon = icon
        self.title = title
        self.desc = description
        self.selectCell = selectCell
    }
    
    init(bigWithIcon icon:UIImage?, selectCell:@escaping ()->()) {
        self.type = 1
        self.icon = icon
        self.selectCell = selectCell
    }
    
    var min:Double = 0
    var max:Double = 0
    var current:Double = 0
    init(rangeWithTitle title:String , min:Double , max:Double,current:Double,selectCell:@escaping ()->()) {
        self.type = 2
        self.title = title
        self.min = min
        self.max = max
        self.current = current
        self.selectCell = selectCell
    }
}

/// 声明一个协议
protocol ModularModellProtocol {
    //协议内部申明一个 结构体的model 支持set 方法和get 方法
    var model:ModularModel?{get set}
    
}
