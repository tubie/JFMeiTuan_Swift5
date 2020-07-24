//
//  JFMeViewController.swift
//  JFMeiTuan_Swift
//
//  Created by linjianfang on 2017/8/29.
//  https://github.com/tubie/JFMeiTuan_Swift3.0
//

import UIKit
import SwiftyJSON
import ObjectMapper
import Alamofire

class JFMeViewController: JFBaseViewController ,UITableViewDataSource,UITableViewDelegate,listButtonDelegate {//遵循协议
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初始化导航栏
        initNav()
        
        //初始化视图
        initView()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //网络请求
        initData()
    }
    //初始化导航栏
    func initNav(){
//        self.title = "我的"
        //去除系统的所有的导航栏下划线
//        UINavigationBar.appearance().shadowImage = UIImage()
//        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        
        //去除系统的所有的导航栏下划线
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
        
//        self.navigationController?.navigationBar.tintColor = JFStyle.navigarionBarColor()
        
      
        
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(setting))
        let play = UIBarButtonItem(title: "Play", style: .plain, target: self, action: #selector(notice))
        
        navigationItem.rightBarButtonItems = [add, play]

        

    }
    
    
   

    
    @objc func setting(sender: AnyObject){
        
    }
    @objc func notice(sender: AnyObject){
        
    }
   
    //初始化视图
    func initView() {
        
        //获取屏幕的尺寸
        let fullScreenSize = UIScreen.main.bounds.size
        // Do any additional setup after loading the view.
        //[[UIScreen mainScreen] applicationFrame].size
        
        let meTableView = UITableView(frame :.zero, style:.grouped)
        meTableView.separatorStyle = .none


        self.view.addSubview(meTableView)
        
        //用snapkit布局
        meTableView.snp.makeConstraints { (make) in
            make.height.equalTo(fullScreenSize.height-64-50)
            make.width.equalTo(fullScreenSize.width)
            make.center.equalTo(self.view)
        }
        
//        meTableView.register(JFMeCell.classForCoder(), forCellReuseIdentifier: ID)
//        meTableView.register(JFMeHeaderCell.classForCoder(), forCellReuseIdentifier: headerCellID)
//        meTableView.register(JFListCell.classForCoder(), forCellReuseIdentifier: ListCellID)


        meTableView.dataSource = self
        meTableView.delegate = self
        
        meTableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if section == 0 {
            return 1
        }else if section == 1 {
            return 1
        }else if section == 2{
            return cellList1().count
        }
        return cellList2().count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
  
        var cell  = UITableViewCell()
        
        if indexPath.section == 0 {
            
            cell = JFMeHeaderCell.CellWithTableView(tableView)
            
            let InfoDictionary = ["acconnt":"lin18936679226","info":"个人信息","headImageName":"baby_icon_booking"]
            
            //传递模型
            (cell as? JFMeHeaderCell)? .meInfoModel =  JFMeInfoModel(JSON: InfoDictionary)//地点转模型

            return cell

        }else if indexPath.section == 1 {
            
            //获取是三个按钮的数组源
            let jsonArray = listButtons()
            //字典数组转模型数组
            let buttons:[JFMeListCellModel] = Mapper<JFMeListCellModel>().mapArray(JSONArray: jsonArray as! [[String : Any]])
            
            //创建cell 并传一个model  array
            cell = JFListCell.CellWithTableView(tableView,array: buttons as NSArray)
            (cell as? JFListCell)?.delegate = self//委托给当前控制器

           
         
            //传递模型数组
//            (cell as! JFListCell).buttonArray = buttons as NSArray?
            return cell

          
            
        }else if indexPath.section == 2 {
            //创建cell
            cell =  JFMeCell.CellWithTableView(tableView)
            //字典数组转模型数组
            let modelArray = Mapper<JFMeModel>().mapArray(JSONArray: cellList1() as! [[String : Any]])
            
            //传递模型
            (cell as? JFMeCell)? .meModel = modelArray[indexPath.row]
            
            //返回cell
            return cell
        
        }
        else{
            //创建cell
            cell =  JFMeCell.CellWithTableView(tableView)
            //字典数组转模型数组
            let modelArray = Mapper<JFMeModel>().mapArray(JSONArray: cellList2() as! [[String : Any]])
            
            //传递模型
            (cell as? JFMeCell)? .meModel = modelArray[indexPath.row]
            
            //返回cell
            return cell
            
        }

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        if indexPath.section == 0 {
            return 100
        }
        else if indexPath.section == 1 {
            return 60
        }
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        if section == 0   {
            return CGFloat.leastNormalMagnitude

        }else if section == 1{
            return CGFloat.leastNormalMagnitude
        }
        return tableView.sectionHeaderHeight
    }

    func listButtons() -> Array<Any> {
        let dict1 = ["buttonTitle":"收藏","buttonImageName":"baby_icon_booking"]
        let dict2 = ["buttonTitle":"评价","buttonImageName":"baby_icon_booking"]
        let dict3 = ["buttonTitle":"评价","buttonImageName":"baby_icon_booking"]
        
        let jsonArray = [dict1,dict2,dict3]
        
        return jsonArray
    }
    
    func cellList1 () -> Array<Any> {

        let dict1 = ["headImageName":"baby_icon_booking","type":"我的钱包","info":""]
        let dict2 = ["headImageName":"baby_icon_booking","type":"余额","info":"0.00"]
        let dict3 = ["headImageName":"baby_icon_booking","type":"抵用券","info":"3张待使用"]
        let dict4 = ["headImageName":"baby_icon_booking","type":"卡包","info":"一张"]



        let jsonArray = [dict1,dict2,dict3,dict4]
        
        return jsonArray
    }
    
    func cellList2 () -> Array<Any> {

        let dict5 = ["headImageName":"baby_icon_booking","type":"好友去哪","info":"跟好友一起玩"]
        let dict6 = ["headImageName":"baby_icon_booking","type":"会员中心","info":""]
        let dict7 = ["headImageName":"baby_icon_booking","type":"手机充值","info":""]
        let dict8 = ["headImageName":"baby_icon_booking","type":"发票助手","info":""]
        
        
        let jsonArray = [dict5,dict6,dict7,dict8]
        
        return jsonArray
    }

    // 懒加载
    lazy var datas: [Int] = {
        // 创建一个存放int的数组
        var nums = [Int]()
        // 添加数据
        for i in 0...5 {
            nums.append(i)
        }
        // 返回
        return nums
    }()
    
    //实现代理方法
    func listButtonClick(btn: UIButton){
        print("\(btn.tag)")
    }
    
    func initData() {
        let urlString = "http://www.weather.com.cn/data/cityinfo/101010100.html"
        Alamofire.request(urlString)
            .responseJSON { response in
            switch response.result {
            case .success:
                print("请求成功")
                print("\(response.result)")
            case .failure(let error):
                print("请求失败")
                print(error)
            }
        }
        
//        let urlStr = "http://192.168.88.200:8080/MJServer/video?type=XML"
        
//        Alamofire.request(urlString,method:.get )
//
//            .response { (request:NSURLRequest?, response:HTTPURLResponse?, responseData:NSData?, error:NSError?) in
//
//                /*
//                 网络请求结束，成功时 error == nil。请求返回的数据存在 responseData 中，为 NSData 格式。
//                 */
//        }
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
