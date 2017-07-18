//
//  Listing.swift
//  Bazaar
//
//  Created by Kostya Dombrovski on 7/15/17.
//  Copyright © 2017 Kostya Dombrovski. All rights reserved.
//

import UIKit

class Listing {
	
	// MARK: Properties
	var title: String
	var photo: UIImage
	var price: Double
	// var user: User
	
	// MARK: Initialization
	init(title: String, photo: UIImage, price: Double) {
		self.title = title
		self.photo = photo
		self.price = price
	}
}
