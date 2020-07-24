//
//  BlurCell.swift
//  ModularTable
//
//  Created by mikun on 2018/8/15.
//  Copyright © 2018 mdk. All rights reserved.
//

import UIKit

class BlurCell: UITableViewCell ,TableNodeProtocol{

	@IBOutlet weak var titleLabel: UILabel!
	
	@IBOutlet weak var iconImageView: UIImageView!
	
	@IBOutlet weak var backgroundImageVIew: UIImageView!

	var node: TableNode?{
		didSet{
			guard let node = node else { return }
			titleLabel.text = node.title
			iconImageView.image = node.icon
			backgroundImageVIew.image = node.backgroundImage
		}
	}

}
