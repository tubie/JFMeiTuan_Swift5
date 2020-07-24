//
//  JFMineCell.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/7/23.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit


//定义一个协议 声名一个协议的方法 buttonClick
protocol JFMineCellClickDelegate:NSObjectProtocol {
    //cell的类型的枚举 用来表示cell的类型
    func mineCellClick(mineCellType:MineCellType, index:Int)
}

class JFMineCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var cellTitleClass: UILabel!
    
    @IBOutlet weak var bottomLineView: UIView!
    @IBOutlet weak var collectionViewLayout: UICollectionViewFlowLayout!
    
    
    weak var delegate:JFMineCellClickDelegate?
    
    var cellType:MineCellType?
    
    var modelArray:NSArray = []{
        didSet{
            collectionView.reloadData()

        }
    }
    
    //重写set方法
    var cellTitle:NSString?{
        didSet{
            cellTitleClass.text = cellTitle! as String
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        //这个地方注意和OC很像，看看cell是通过什么创建的 纯代码还是xib如果是 纯代码则使用registerClass方法
        /**
         - (void)registerClass:(nullable Class)cellClass forCellWithReuseIdentifier:(NSString *)identifier;
         - (void)registerNib:(nullable UINib *)nib forCellWithReuseIdentifier:(NSString *)identifier;
         */
        collectionView.register(UINib(nibName: "JFMineCollectionCell", bundle: nil), forCellWithReuseIdentifier:reuseIdentifierID as String)
        
        //属性的方式设置间距
        collectionViewLayout.minimumLineSpacing = 0.0
        collectionViewLayout.minimumInteritemSpacing = 0.0
        
        collectionView.isScrollEnabled = false


        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func cellWithTableView(_ tableView:UITableView) -> JFMineCell {
        
        let JFMineCellID:NSString = "JFMineCellID"
        
        var mineCell = tableView.dequeueReusableCell(withIdentifier: JFMineCellID as String )
        
        if mineCell == nil {
            
            mineCell = Bundle.main.loadNibNamed("JFMineCell", owner: nil, options: nil)?.last as? UITableViewCell
        }
        return mineCell as! JFMineCell
    }
}

extension JFMineCell{
    /// UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return modelArray.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell:JFMineCollectionCell = JFMineCollectionCell.cellWithCollectionView(collectionView, indexPath as NSIndexPath)
        
        cell.commonModel = modelArray[indexPath.row] as? JFCommonModel
        
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: (JFSCREEN_WIDTH-30)/4, height: (self.frame.size.height - 30)/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (delegate != nil) {
            delegate?.mineCellClick(mineCellType: cellType!, index: indexPath.row)
        }
    }
    
    //代理的方式设置间距
    //    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    //        return 0.0
    //    }
    //
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    //        return 0.0
    //    }
}

//分类里面不支持重写set 方法
//extension JFMineCell{
    //重写set方法
//    var cellTitle:NSString?{
//        didSet{
//            cellTitleClass.text = cellTitle! as String
//        }
//    }
    
//    var commonModel:JFCommonModel?{
//        didSet{
//
//        }
//    }
    
//}


