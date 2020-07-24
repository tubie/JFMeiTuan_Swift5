//
//  JFTestVC.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/8/24.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit

class JFTestVC: JFBaseViewController {
    
    let table = UITableView(frame: CGRect(), style: .grouped)
    var nodeList:[[TableNode]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(table)
        table.delegate = self
        table.dataSource = self
        stepupNodeList()
    }
    override func viewDidLayoutSubviews() {
        table.frame = view.bounds
    }
    
    func stepupNodeList() -> () {
        var subList:[TableNode] = []
        
//
        subList.append(TableNode(regularWithIcon: #imageLiteral(resourceName: "大笑"), title: "2018新闻", description: "点击查看更多"){ [weak self] in
            let pushedCtr = PushedCtr()
            pushedCtr.title = "2018新闻"
            self?.navigationController?.pushViewController(pushedCtr, animated: true)
        })
        subList.append(TableNode(rangeWithTitle: "今日温度", min: 29, max: 36 ,current:32){ [weak self] in
            let pushedCtr = PushedCtr()
            pushedCtr.title = "今日温度"
            self?.navigationController?.pushViewController(pushedCtr, animated: true)
        })

        nodeList.append(subList)

        subList = []

        subList.append(TableNode(description: "广告位招租"){[weak self] in
            let pushedCtr = PushedCtr()
            pushedCtr.title = "广告位招租"
            self?.navigationController?.pushViewController(pushedCtr, animated: true)
        })
        subList.append(TableNode(rangeWithTitle: "今日湿度", min: 20, max: 200 , current:180){[weak self] in
            let pushedCtr = PushedCtr()
            pushedCtr.title = "今日湿度"
            self?.navigationController?.pushViewController(pushedCtr, animated: true)
        })
        subList.append(TableNode(webWithTitle: "谷歌回归", backgroundImage: #imageLiteral(resourceName: "大笑"), icon: #imageLiteral(resourceName: "大笑")){[weak self] in
            let pushedCtr = PushedCtr()
            pushedCtr.title = "谷歌回归"
            self?.navigationController?.pushViewController(pushedCtr, animated: true)
        })
        
        nodeList.append(subList)
    }
    


}

extension JFTestVC : UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return nodeList.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nodeList[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let node = nodeList[indexPath.section][indexPath.row]
        var cell = tableView.dequeueReusableCell(withIdentifier: "\(node.type)") as? (UITableViewCell & TableNodeProtocol)
        if cell == nil {
            cell = Bundle.main.loadNibNamed("TableCell", owner: nil, options: nil)?[node.type] as? (UITableViewCell & TableNodeProtocol)
        }
        cell?.node = node
        
        return cell!;
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        table.deselectRow(at: indexPath, animated: true)
        nodeList[indexPath.section][indexPath.row].selectCell?()
    }
}

