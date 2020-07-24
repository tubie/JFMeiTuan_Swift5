//
//  JFBaseNetwork.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/8/7.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit
import Alamofire

//enum MethodType {
//    case get
//    case post
//}

//定义一个block闭包
typealias success = () -> Any
typealias failure = () -> Error


class JFBaseNetwork: NSObject {
    var value = ""
    static let shareInstance = JFBaseNetwork()
    private override init(){}
    
    var successBlock = success.self
    var failureBlock = failure.self

     func initData() {
        
        let urlString = "http://www.weather.com.cn/data/cityinfo/101010100.html"

        Alamofire.request(urlString, method:HTTPMethod.get, parameters: [:], encoding: URLEncoding.default, headers: JFHeaders()).responseJSON { (response) in
            switch response.result {
                case .success:
                    print("请求成功")
                    print("\(response.result)")
                    print(response.result.value)
                case .failure(let error):
                    print("请求失败")
                    print(error)
                }
        }
        
//        let urlString = "http://www.weather.com.cn/data/cityinfo/101010100.html"
//        Alamofire.request(urlString)
//            .responseJSON { response in
//                switch response.result {
//                case .success:
//                    print("请求成功")
//                    print("\(response.result)")
//                case .failure(let error):
//                    print("请求失败")
//                    print(error)
//                }
//        }
        
        
    }
    
    static func postDataByString(urlSting: String, bodyDic: NSDictionary!, succeed: @escaping (_ responeObject: NSString) -> (), fail: @escaping (_ error: AnyObject) -> ()){
        
      
    }
    
    func JFHeaders() -> (Dictionary<String, String>) {
        //声明一个字典
        let someDict:[String:String] = ["1":"One", "2":"Two", "3":"Three"]
        return someDict
    }
    
}




