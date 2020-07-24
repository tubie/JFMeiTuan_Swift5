//
//  JFLog.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/8/13.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import Foundation

//利用全局函数,自定义log
func JFLog<T>(_ message: T, file: String = #file, method: String = #function, line: Int = #line) {
    #if DEBUG
    print("\((file as NSString).lastPathComponent):[第\(line)行], \(method): \n \(message)")
    #endif
}
