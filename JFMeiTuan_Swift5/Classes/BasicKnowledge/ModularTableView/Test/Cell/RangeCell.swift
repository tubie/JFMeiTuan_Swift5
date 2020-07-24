//
//  Rangeswift
//  ModularTable
//
//  Created by mikun on 2018/8/15.
//  Copyright © 2018 mdk. All rights reserved.
//

import UIKit

class RangeCell: UITableViewCell ,TableNodeProtocol{

	@IBOutlet weak var titleLabel: UILabel!
	
	@IBOutlet weak var minLabel: UILabel!
	@IBOutlet weak var maxLabel: UILabel!
	@IBOutlet weak var sliderView: UISlider!

	var node: TableNode? {
		didSet{
			guard let node = node else { return }
			titleLabel.text = node.title
			maxLabel.text = "\(node.max)"
			minLabel.text = "\(node.min)"
			sliderView.maximumValue = Float(node.max)
			sliderView.minimumValue = Float(node.min)
			sliderView.value = Float(node.current)
		}
	}
}
