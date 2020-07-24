//
//  JFMineTopCategoryCell.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/8/10.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit


//定义一个协议 声名一个协议的方法 buttonClick
protocol JFMineTopCategoryCellDelegate:NSObjectProtocol {
    //cell的类型的枚举 用来表示cell的类型
    func mineTopCategoryCellClick(index:Int)
}

class JFMineTopCategoryCell: UITableViewCell {

    @IBOutlet weak var historyView: UIView!
    @IBOutlet weak var commitView: UIView!
    @IBOutlet weak var collectionView: UIView!
    
    weak var delegate:JFMineTopCategoryCellDelegate?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(self.viewClick(index:)))
        historyView.addGestureRecognizer(tap)
        
        
        let commitViewTap = UITapGestureRecognizer.init(target: self, action: #selector(self.viewClick(index:)))
        commitView.addGestureRecognizer(commitViewTap)
        
        
        let collectionViewTap = UITapGestureRecognizer.init(target: self, action: #selector(self.viewClick(index:)))
        collectionView.addGestureRecognizer(collectionViewTap)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func cellWithTableView(_ tableView:UITableView) -> JFMineTopCategoryCell {
        
        let JFMineTopCategoryCell:NSString = "JFMineTopCategoryCell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: JFMineTopCategoryCell as String )
        
        if cell == nil {
            
            cell = Bundle.main.loadNibNamed("JFMineTopCategoryCell", owner: nil, options: nil)?.last as? UITableViewCell
        }
        return cell as! JFMineTopCategoryCell
    }
    
    @objc func viewClick(index:Int)  {
        if (delegate != nil)  {
            delegate?.mineTopCategoryCellClick(index: index)
        }
    }
    
}
