//
//  JFReceiveValueViewController.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/7/24.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit

//枚举的定义
enum sendType{
    case propertyType
    case singleCaseType
}

//定义一个协议 声名一个协议的方法 buttonClick
protocol receiveValueDelegate:NSObjectProtocol {
    func buttonClick(value: String)
}

//定义一个block闭包
typealias receiveValueClosure = (_ value:String) -> Void

class JFReceiveValueViewController: JFBaseViewController {

    @IBOutlet weak var textField: UITextField!
    
    //声明一个代理
    weak var delegate:receiveValueDelegate?
    
    //声明一个闭包用来接收闭包
    var receiveClosure:receiveValueClosure?
    
    //声明一个属性
    var receiveValue:NSString!
    
//    //声明一个枚举
    var sendValueType:sendType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //属性传值的时候
        if sendValueType == sendType.propertyType {
            //接收属性传过来的值
            textField.text = receiveValue as String?
        }else if (sendValueType == sendType.singleCaseType ){//单例传值
            //单例传值
            textField.text =  JFSendSingleton.shareInstance.value
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backClick(_ sender: Any) {
        //代理
        if self.delegate != nil {
            self.delegate?.buttonClick(value: textField.text!)
        }
        
        //闭包
        if self.receiveClosure != nil {
            self.receiveClosure!(textField.text!)
        }
        
        //发布通知
        JFNotificationCenter.post(name: NSNotification.Name(rawValue: noticeSenderValue as String), object: textField.text )
        
        navigationController?.popViewController(animated: true)
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
