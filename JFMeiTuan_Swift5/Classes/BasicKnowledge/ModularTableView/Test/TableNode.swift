//
//  TableNode.swift
//  ModularTable
//
//  Created by mikun on 2018/8/15.
//  Copyright © 2018 mdk. All rights reserved.
//

import UIKit

struct TableNode {
	var type:Int
	var icon:UIImage?
	var title:String = ""
	var desc:String = ""
	var selectCell:(()->())?
	init(regularWithIcon icon:UIImage?, title:String , description:String,selectCell:@escaping ()->()) {
		self.type = 0
		self.icon = icon
		self.title = title
		self.desc = description
		self.selectCell = selectCell
	}
	var min:Double = 0
	var max:Double = 0
	var current:Double = 0
	init(rangeWithTitle title:String , min:Double , max:Double,current:Double,selectCell:@escaping ()->()) {
		self.type = 1
		self.title = title
		self.min = min
		self.max = max
		self.current = current
		self.selectCell = selectCell
	}

	init(description:String,selectCell:@escaping ()->()) {
		self.type = 2
		self.desc = description
		self.selectCell = selectCell
	}

	var backgroundImage:UIImage?
	init(webWithTitle title:String , backgroundImage:UIImage , icon:UIImage,selectCell:@escaping ()->()) {
		self.type = 3
		self.title = title
		self.backgroundImage = backgroundImage
		self.icon = icon
		self.selectCell = selectCell
	}
}
protocol TableNodeProtocol {
	var node:TableNode?{get set}
}
