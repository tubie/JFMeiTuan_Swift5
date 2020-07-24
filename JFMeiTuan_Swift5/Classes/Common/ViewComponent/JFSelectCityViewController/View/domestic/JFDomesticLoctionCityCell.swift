//
//  JFDomesticLoctionCityCell.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/8/27.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit

class JFDomesticLoctionCityCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var collectionView: UICollectionView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName: "JFDomesticLoctionCitySubCell" as String, bundle: nil), forCellWithReuseIdentifier:selectLoctionCityReuseIdentifierID as String)
        
        //属性的方式设置间距
        collectionLayout.minimumLineSpacing = 0.0
        collectionLayout.minimumInteritemSpacing = 0.0
        
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = UIColor.groupTableViewBackground
        
        collectionView.reloadData()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
        
        class func cellWithTableView(_ tableView:UITableView) -> JFDomesticLoctionCityCell {
            
            let JFDomesticLoctionCityCell:NSString = "JFDomesticLoctionCityCell"
            
            var cell = tableView.dequeueReusableCell(withIdentifier: JFDomesticLoctionCityCell as String )
            
            if cell == nil {
                
                cell = Bundle.main.loadNibNamed("JFDomesticLoctionCityCell", owner: nil, options: nil)?.last as? UITableViewCell
            }
            return cell as! JFDomesticLoctionCityCell
        }
        
        
        /// UICollectionViewDataSource
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
            return 3;
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
            
            let cell  = JFDomesticLoctionCitySubCell.cellWithCollectionView(collectionView, indexPath as NSIndexPath)
            
            //        cell.model = modelArray[indexPath.row]
            
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
            return CGSize(width: JFSCREEN_WIDTH/3, height: self.frame.size.height)
        }
        
    
}
