//
//  DescriptionCell.swift
//  ModularTable
//
//  Created by mikun on 2018/8/15.
//  Copyright © 2018 mdk. All rights reserved.
//

import UIKit

class DescriptionCell: UITableViewCell ,TableNodeProtocol{

	@IBOutlet weak var descriptionLabel: UILabel!
	
	var node: TableNode? {
		didSet{
			guard let node = node else { return }
			descriptionLabel.text = node.desc
		}
	}

}
