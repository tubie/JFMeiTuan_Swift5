//
//  JFMeHeaderCell.swift
//  JFMeiTuan_Swift
//
//  Created by linjianfang on 2017/8/30.
//  Copyright © 2017年 linjianfang. All rights reserved.
//

import UIKit

class JFMeHeaderCell: UITableViewCell {
    
    //声明全局变量 供外部使用
    var headImageView : UIImageView!
    var accountLabel : UILabel!
    var infoLabel : UILabel!
    var arrowImageView : UIImageView!
    
    //定义去全局的变量供外部使用
    var meInfoModel : JFMeInfoModel?{
        didSet{
            //重写set方法
            headImageView.image = UIImage.init(named:  (meInfoModel?.headImageName)!)
            accountLabel.text = meInfoModel?.acconnt
            infoLabel.text = meInfoModel?.info
            arrowImageView.image = UIImage.init(named: "icon_cell_rightArrow")

        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    /*构造方法创建cell*/
    class func CellWithTableView(_ tableView:UITableView) -> JFMeHeaderCell {
        
        let identifier = "JFMeHeaderCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? JFMeHeaderCell
        if  cell == nil {
            cell = JFMeHeaderCell.init(style: .subtitle, reuseIdentifier: identifier)
            
        }
        return cell!
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = JFStyle.navigarionBarColor()
        setUpUI()
    }
    
    
    
    func setUpUI(){
        //初始化控件
        headImageView = UIImageView()
        
        
        accountLabel = UILabel()
        accountLabel.font = UIFont.systemFont(ofSize: 14)
        accountLabel.textColor = UIColor.white

        
        infoLabel = UILabel()
        infoLabel.textColor = UIColor.white
        infoLabel.font = UIFont.systemFont(ofSize: 12)
        
        
        arrowImageView = UIImageView()
        
        //添加控件
        self.contentView.addSubview(headImageView)
        self.contentView.addSubview(accountLabel)
        self.contentView.addSubview(infoLabel)
        self.contentView.addSubview(arrowImageView)
        
        
        headImageView.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.width.height.equalTo(50)
            make.centerY.equalToSuperview()
        }
        
        //布局控件
        accountLabel.snp.makeConstraints { (make ) in
            //左边紧贴着headImageView 并右移10像素
            make.left.equalTo(headImageView.snp.right).offset(10)
            make.width.equalTo(200)
            make.height.equalTo(30)
            make.top.equalTo(headImageView.snp.top)
            
        }
        
        infoLabel.snp.makeConstraints { (make ) in
            make.left.equalTo(headImageView.snp.right).offset(10)
//            make.width.equalTo(100)
            make.height.equalTo(30)
            make.bottom.equalTo(headImageView.snp.bottom)
            
        }
        
        arrowImageView.snp.makeConstraints { (make ) in
            make.left.equalTo(infoLabel.snp.right).offset(10)
            make.width.equalTo(4)
            make.height.equalTo(6.5)
            make.centerY.equalTo(infoLabel)
        }
        
        
    }
    
}
