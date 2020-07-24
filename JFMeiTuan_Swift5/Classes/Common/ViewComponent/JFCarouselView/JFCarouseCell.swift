//
//  JFCarouseCell.swift
//  JFMeiTuan_Swift
//
//  Created by linjf on 2018/8/13.////
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import UIKit


//定义一个协议 声名一个协议的方法 buttonClick
protocol JFCarouseCellDelegate:NSObjectProtocol {
    //cell的类型的枚举 用来表示cell的类型
    func carouseCellClickAtIndex(index:Int)
}

class JFCarouseCell: UITableViewCell,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    fileprivate var timer: Timer?
    public var timeInterval: Int = 2
    
    
    let JFCount = 100
    
    weak var deleagte:JFCarouseCellDelegate?


    var imageUrlArray:[String]?{
        didSet{
            pageControl.numberOfPages = (imageUrlArray?.count)!
            
            collectionView.reloadData()
            
            startTimer()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName: "JFCarouselCollectionCell" as String, bundle: nil), forCellWithReuseIdentifier:carouselCellCollectionReuseIdentifierID as String)
        
        //属性的方式设置间距
        collectionLayout.minimumLineSpacing = 0.0
        collectionLayout.minimumInteritemSpacing = 0.0
        
        //水平滚动
        collectionLayout.scrollDirection =  .horizontal
        collectionView.bounces                        = false
        collectionView.showsVerticalScrollIndicator   = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.scrollsToTop                   = false
        collectionView.decelerationRate               = UIScrollView.DecelerationRate(rawValue: 0.0)
        collectionView.isPagingEnabled                = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func cellWithTableView(_ tableView:UITableView) -> JFCarouseCell {
        
        let  cellID:String = "cellID"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID as String )
        
        if cell == nil {
            
            cell = Bundle.main.loadNibNamed("JFCarouseCell", owner: nil, options: nil)?.last as? UITableViewCell
        }
        return cell as! JFCarouseCell
    }
    
}

extension JFCarouseCell{
    /// UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return (imageUrlArray?.count)! * 2 * JFCount;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell:JFCarouselCollectionCell = JFCarouselCollectionCell.cellWithCollectionView(collectionView, indexPath as NSIndexPath)
        
        cell.imageUrlStr = imageUrlArray?[indexPath.item % (imageUrlArray?.count)!] ?? ""
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: self.frame.size.width, height: self.frame.size.height )
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                
        let index = indexPath.item % (imageUrlArray?.count)!
        if deleagte != nil {
            deleagte?.carouseCellClickAtIndex(index: index)
        }
    }
}

extension JFCarouseCell{
    //开启定时器
    func startTimer()  {
        cancelTimer()
        timer =  Timer.init(timeInterval: Double(timeInterval), target: self, selector: #selector(timeRepeat), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: RunLoop.Mode.common)
        
    }
    //关闭定时器
    func cancelTimer()  {
        if timer != nil{
        timer?.invalidate()
        timer = nil
        }
    }
    
    //开启定时器
    @objc func timeRepeat()  {
 
        let indexPath = collectionView.indexPathsForVisibleItems.last
        guard indexPath != nil else {
            return
        }
        let nextPath = IndexPath(item: (indexPath?.item)! + 1, section: (indexPath?.section)!)
        collectionView.scrollToItem(at: nextPath, at: .left, animated: true)
    }
    
    //监听手动减速完成(停止滚动)  - 获取当前页码,滚动到下一页,如果当前页码是第一页,继续往下滚动,如果是最后一页回到第一页
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let offsetX : CGFloat = scrollView.contentOffset.x
        let page : NSInteger = NSInteger(offsetX / bounds.size.width)
        let itemsCount = collectionView.numberOfItems(inSection: 0)
        if page == 0 { //第一页
            collectionView.contentOffset = CGPoint(x: offsetX + CGFloat((imageUrlArray?.count)!) * CGFloat(JFCount) * bounds.size.width, y: 0)
        } else if page == itemsCount - 1 { //最后一页
            collectionView.contentOffset = CGPoint(x: offsetX - CGFloat((imageUrlArray?.count)!) * CGFloat(JFCount) * bounds.size.width, y: 0)
        }
    }
    //滚动动画结束的时候调用 - 获取当前页码,滚动到下一页,如果当前页码是第一页,继续往下滚动,如果是最后一页回到第一页
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        scrollViewDidEndDecelerating(scrollView)
    }
    
    //正在滚动(设置分页) -- 算出滚动位置,更新指示器
    internal func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x
        var page = NSInteger(offsetX / bounds.size.width + 0.5)
        page = page % (imageUrlArray?.count)!
        pageControl.currentPage = page
    }
    
    //开始拖拽时,停止定时器
    internal func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        timer?.fireDate = Date.distantFuture
    }
    
    //结束拖拽时,恢复定时器
    internal func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        timer?.fireDate = Date(timeIntervalSinceNow: TimeInterval(timeInterval))
    }
    


    
}
