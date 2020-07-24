//
//  JFMacroConst.swift
//  JFMeiTuan_Swift
//
//  Created by linJF on 2018/7/25.
//  Copyright © 2018年 linjianfang. All rights reserved.
//

import Foundation
import UIKit

let JFKeyWindow             = UIApplication.shared.keyWindow
let JFApplication           = UIApplication.shared
let JFAppDelegate           = UIApplication.shared.delegate
let JFUserDefaults          = UserDefaults.standard
let JFNotificationCenter    = NotificationCenter.default


let JFSCREEN_HEIGHT         = UIScreen.main.bounds.height
let JFSCREEN_WIDTH          = UIScreen.main.bounds.width

let JFNavigationHeight :CGFloat            = UINavigationBar.appearance().frame.size.height  /* 导航条高度 44 */
let JFStatuBarHeight   :CGFloat            = UIApplication.shared.statusBarFrame.size.height  /* 状态栏高度  20*/
let JFNavigationHeightAndStatuBarHeight    = JFNavigationHeight + JFStatuBarHeight      //64

//屏幕分辨率比例
let JFScreenScale:CGFloat = UIScreen.main.responds(to: #selector(getter: UIScreen.main.scale)) ? UIScreen.main.scale : 1.0

//不同屏幕尺寸字体适配（375，667是因为目前苹果开发一般用IPHONE6做中间层 如果不是则根据实际情况修改）
//相对于iPhone6的宽度比例
let JFScreenWidthRatio:CGFloat =  JFSCREEN_WIDTH / 375;
let JFScreenHeightRatio:CGFloat = JFSCREEN_HEIGHT / 667;


//根据传入的值算出乘以比例之后的值
func JF_adaptedWidth(width:CGFloat) ->CGFloat {
    return CGFloat(ceil(Float(width))) * JFScreenWidthRatio
}

func JF_adaptedHeight(height:CGFloat) ->CGFloat {
    return CGFloat(ceil(Float(height))) * JFScreenHeightRatio
}


/* 设备系统相关  */
let JFiOSVersion:String       = UIDevice.current.systemVersion     /* iOS系统版本 */


/* app版本  以及设备系统版本 */
let JFinfoDictionary             = Bundle.main.infoDictionary
let JFAppName: String?         = JFinfoDictionary!["CFBundleDisplayName"] as? String        /* App名称 */
let JFAppVersion: String?      = JFinfoDictionary!["CFBundleShortVersionString"] as? String /* App版本号 */
let JFAppBuildVersion: String? = JFinfoDictionary!["CFBundleVersion"] as? String            /* Appbuild版本号 */
let JFAppBundleId: String?     = JFinfoDictionary!["CFBundleIdentifier"] as? String                 /* app bundleId */
let JFLatformName: String?     = JFinfoDictionary!["DTPlatformName"] as? String  //平台名称（iphonesimulator 、 iphone）


/* 检查系统版本 */
//版本号相同
func JF_SystemVersionEqual(version:String) ->Bool {
    return UIDevice.current.systemVersion == version
}
//系统版本高于等于该version  测试发现只能传入带一位小数点的版本号  不然会报错    具体原因待探究
func JF_SystemVersionGreaterThan(version:String) ->Bool{
    return UIDevice.current.systemVersion.compare(version, options: .numeric, range: version.startIndex..<version.endIndex, locale: Locale(identifier:version)) != ComparisonResult.orderedAscending
}

//系统版本低于等于该version  测试发现只能传入带一位小数点的版本号  不然会报错    具体原因待探究
func JF_SystemVersionLessThan(version:String) ->Bool{
    return UIDevice.current.systemVersion.compare(version, options: .numeric, range: version.startIndex..<version.endIndex, locale: Locale(identifier:version)) != ComparisonResult.orderedDescending
}



/// Cache缓存文件夹
let JFCacheDir = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last

/// Documents文件夹
let JFDocumentsDir = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first


//获取本地存储数据
func get_userDefaults(key : String)->AnyObject?{
    var saveStr : AnyObject! = JFUserDefaults.object(forKey: key) as AnyObject
    saveStr = (saveStr == nil) ? "" as AnyObject : saveStr
    return saveStr
}
//存储数据
func save_userDefaults(key : String,value:AnyObject?){
    JFUserDefaults.set(value!, forKey: key)
}

//字符串转数组
func stringToArray(str:String)->NSArray{
    var dataArray:[String] = []
    for items in str{
        dataArray.append("\(items)")
    }
    return dataArray as NSArray
}

//读取本地图片 （文件名，后缀名）
func JF_loadImage(imageName __imgName__:String,imgExtension __imgExt__:String) -> UIImage {
    return UIImage.init(contentsOfFile: Bundle.main.path(forResource: __imgName__, ofType: __imgExt__)!)!
}

//定义UIImage对象 （文件名）  png格式

func JF_loadPNGImage(imageName __imgName__:String) -> UIImage {
    return UIImage.init(contentsOfFile: Bundle.main.path(forResource: __imgName__, ofType: "png")!)!
}

let JF_ImageWithName: (String) -> UIImage? = {imageName in
    return UIImage(named: imageName);
}

/// 系统普通字体
var JF_SystemFontWithSize: (CGFloat) -> UIFont = {size in
    return UIFont.systemFont(ofSize: size);
}
/// 系统加粗字体
var JF_BoldFontWithSize: (CGFloat) -> UIFont = {size in
    return UIFont.boldSystemFont(ofSize: size);
}

func JF_RGBCOLOR(r:CGFloat,_ g:CGFloat,_ b:CGFloat) -> UIColor{
    return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: 1.0)
}
func JF_RGBColorFromHex(rgbValue: Int) -> (UIColor) {
    return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0,
                   green: ((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0,
                   blue: ((CGFloat)(rgbValue & 0xFF)) / 255.0, alpha: 1.0)
}

let JFEmptyHeaderViewHeight = 0.0001


