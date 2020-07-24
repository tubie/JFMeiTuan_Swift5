//
//  JFCarouselView.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/8/13.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit

class JFCarouselView: UIView,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    
//    private var carouselView: UIView!

    @IBOutlet weak var collectionLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    var imageUrlArray:[String]?{
        didSet{
//            pageControl.numberOfPages = (imageUrlArray?.count)!
            
//            collectionView.reloadData()
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(UINib(nibName: "JFCarouselCollectionCell" as String, bundle: nil), forCellWithReuseIdentifier:carouselCellCollectionReuseIdentifierID as String)
        
        collectionView.backgroundColor                = UIColor.clear
        collectionView.bounces                        = false
        collectionView.showsVerticalScrollIndicator   = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate                       = self
        collectionView.dataSource                     = self
        collectionView.scrollsToTop                   = false
        collectionView.decelerationRate               = UIScrollView.DecelerationRate(rawValue: 0.00000)
        collectionView.isPagingEnabled                = true
        

    }
    override init(frame: CGRect) {
        super.init(frame: frame)

  
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
//    public func xibSetup() {
//        carouselView = Bundle.main.loadNibNamed("JFCarouselView", owner: self, options: nil)?.first as! UIView
//        carouselView.frame = bounds
//        carouselView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        addSubview(carouselView)
//    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return (imageUrlArray?.count)!;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell:JFCarouselCollectionCell = JFCarouselCollectionCell.cellWithCollectionView(collectionView, indexPath as NSIndexPath)
        cell.imageUrlStr = imageUrlArray?[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: self.frame.size.width, height: self.frame.size.height )
    }
    

}
