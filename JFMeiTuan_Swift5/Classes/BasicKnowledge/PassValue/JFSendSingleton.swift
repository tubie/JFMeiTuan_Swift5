//
//  JFSendSingleton.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/7/25.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit

class JFSendSingleton: NSObject {
    
    var value = ""
    static let shareInstance = JFSendSingleton()
    private override init(){}
}
