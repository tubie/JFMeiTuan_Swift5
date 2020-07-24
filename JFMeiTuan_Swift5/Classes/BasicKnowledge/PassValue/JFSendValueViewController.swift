//
//  JFSendValueViewController.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/7/24.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit


class JFSendValueViewController: JFBaseViewController,receiveValueDelegate {


    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "传值"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func propertyClick(_ sender: Any) {
        let VC:JFReceiveValueViewController  = JFReceiveValueViewController.init(nibName: "JFReceiveValueViewController", bundle: nil)
        VC.sendValueType = sendType.propertyType
        VC.receiveValue = textField.text! as NSString
        navigationController?.pushViewController(VC, animated: true)
    }
    @IBAction func delegateClick(_ sender: Any) {
        let VC  = JFReceiveValueViewController.init(nibName: "JFReceiveValueViewController", bundle: nil)
        //代理委托的对象
        VC.delegate = self
        navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBAction func closureClick(_ sender: Any) {
        let VC  = JFReceiveValueViewController.init(nibName: "JFReceiveValueViewController", bundle: nil)
        VC.receiveClosure = { (value:String) -> Void in
            self.textField.text = value
        }
       
        navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBAction func noticeClick(_ sender: Any) {
        
        //观察通知
        JFNotificationCenter.addObserver(self, selector: #selector(JFSendValueViewController.getValue), name: NSNotification.Name(rawValue: noticeSenderValue as String), object: nil)
        let VC  = JFReceiveValueViewController.init(nibName: "JFReceiveValueViewController", bundle: nil)
        navigationController?.pushViewController(VC, animated: true)
    }
    
    
    @IBAction func SingleCase(_ sender: Any) {
        let VC:JFReceiveValueViewController  = JFReceiveValueViewController.init(nibName: "JFReceiveValueViewController", bundle: nil)
        JFSendSingleton.shareInstance.value = textField.text!
        VC.sendValueType = sendType.singleCaseType
        navigationController?.pushViewController(VC, animated: true)
    }
    
    
    /// 代理实现
    func buttonClick(value: String){
        textField.text = value as String
    }
    
    ///通知实现
    @objc func getValue(notice:Notification) {
        textField.text = notice.object as? String
        //移除通知
        JFNotificationCenter.removeObserver(self, name: NSNotification.Name(rawValue: noticeSenderValue as String), object: nil)
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
