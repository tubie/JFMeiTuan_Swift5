//
//  Regularswift
//  ModularTable
//
//  Created by mikun on 2018/8/15.
//  Copyright © 2018 mdk. All rights reserved.
//

import UIKit

class RegularCell: UITableViewCell ,TableNodeProtocol{

	@IBOutlet weak var titleLabel: UILabel!

	@IBOutlet weak var descriptionLabel: UILabel!

	@IBOutlet weak var iconImageView: UIImageView!

	var node: TableNode? {
		didSet{
			guard let node = node else { return }
			titleLabel.text = node.title
			descriptionLabel.text = node.desc
			iconImageView.image = node.icon
		}
	}
}
