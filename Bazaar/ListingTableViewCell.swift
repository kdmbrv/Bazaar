//
//  ListingTableViewCell.swift
//  Bazaar
//
//  Created by Kostya Dombrovski on 7/17/17.
//  Copyright © 2017 Kostya Dombrovski. All rights reserved.
//

import UIKit

class ListingTableViewCell: UITableViewCell {

	@IBOutlet weak var listingImage: UIImageView!
	@IBOutlet weak var listingTitle: UILabel!
	@IBOutlet weak var listingPrice: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
