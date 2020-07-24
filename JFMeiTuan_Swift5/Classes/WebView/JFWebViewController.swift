//
//  JFWebViewController.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/8/8.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit
import WebKit

/*
 1.结构体静态属性
 
 2.枚举静态属性
 
 3.类静态属性
 */

/*
 //第一种：结构体方式
 struct 结构体名 {
 static var(或let) 存储属性  = "hello world"
 static var 计算属性名 : 数据类型 {
 get {
 return 计算后属性值
 }
 set (新属性值) {
 }
 }
 }
 
 //第二种：枚举方式
 enum 枚举名 {
 static var(或let) 存储属性  = "hello world"
 static var 计算属性名 : 数据类型 {
 get {
 return 计算后属性值
 }
 set (新属性值) {
 }
 }
 }
 
 //第三种：类方式
 class 类名 {
 class var 计算属性名 : 数据类型 {
 get {
 return 计算后属性值
 }
 set (新属性值) {
 }
 }
 }
 */

//class MyClassConst{
//    class var estimatedProgress : String{
//        return "estimatedProgress"
//    }
//}

struct MyClassConst{
    static var estimatedProgress : String{
        return "estimatedProgress"
    }
}

//enum MyClassConst{
//    static var estimatedProgress : String{
//        return "estimatedProgress"
//    }
//}

class JFWebViewController: JFBaseViewController,WKUIDelegate,WKNavigationDelegate {
    /*
     var str1 = ""            // 第一种方式
     var str2 = String()      // 第二种方式
     var str3 = "hello word"  // 当初始化一个非空字符串时,可以这样
     */
    
    var urlString  = String()
    
    var webView:WKWebView!
    
    var progBar:UIProgressView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        setUpView()
        
        setUpNavBar()

        loadWebView()
        // Do any additional setup after loading the view.
    }
    
    func setUpView() {
        let webConfiguration = WKWebViewConfiguration()
        //创建wkwebview
        webView = WKWebView.init(frame: CGRect(x: 0, y: 0, width: JFSCREEN_WIDTH, height: JFSCREEN_HEIGHT), configuration: webConfiguration)
        
        webView.navigationDelegate = self
        
        webView.uiDelegate = self
        
        self.view.addSubview(webView)
        
        
        progBar = UIProgressView.init(frame: CGRect(x: 0, y: 0, width: JFSCREEN_WIDTH, height: 30 ))
        progBar.progress = 0.0
        progBar.tintColor = UIColor.black
        webView.addSubview(progBar)
        webView.addObserver(self, forKeyPath: MyClassConst.estimatedProgress, options: NSKeyValueObservingOptions.new, context: nil)
 
    }
    
    func setUpNavBar()  {
        self.setupCustomRightWithTitle(navtStyle: navigationBar.blackStyle,title: "前进", target: self, action: #selector(self.rightBtnClick))
        
        self.setupCustomLeftWithTitle(title: "后退", target: self, action: #selector(self.leftBtnClick))
    }
    
    func loadWebView() {
        //创建网址
        let url = NSURL.init(string: urlString)
        //创建请求
        let request = NSURLRequest.init(url: url! as URL)
        //加载请求
        webView.load(request as URLRequest)
    }
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == MyClassConst.estimatedProgress {
            self.progBar.alpha = 1.0
            progBar.setProgress(Float(webView.estimatedProgress), animated: true)
            if (webView.estimatedProgress >= 1.0){
                UIView.animate(withDuration: 0.3, delay: 0.1, options: UIView.AnimationOptions.curveEaseOut, animations: {
                    self.progBar.alpha = 0.0
                }) { (finished:Bool) in
                    self.progBar.progress = 0.0
                }
            }
        }
    }
    
    
    @objc func rightBtnClick(){
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @objc func leftBtnClick(){
        //先判断webView自己能不能返回 如果可以就返回 如果没有的话 就popVC
        if webView.canGoBack {
            webView.goBack()
        }else{
            navigationController?.popViewController(animated: true)
        }
        
    }
    
    
    //WKNavigationDelegate
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        navigationItem.title = webView.title
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
