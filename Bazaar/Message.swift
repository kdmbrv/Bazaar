//
//  Message.swift
//  Bazaar
//
//  Created by Kostya Dombrovski on 7/15/17.
//  Copyright © 2017 Kostya Dombrovski. All rights reserved.
//

import UIKit

class Message {
	
	//MARK: Properties
	// var user: User
	var listing: Listing
	var messageContent: String
	var previousMessage: Message?
	var nextMessage: Message?
	
	//MARK: Initialization
	init(listing: Listing, messageContent: String, previousMessage: Message?) {
		self.listing = listing
		self.messageContent = messageContent
		
		if (previousMessage != nil) {
			self.previousMessage = previousMessage
			previousMessage?.nextMessage = self
		}
	}
}
