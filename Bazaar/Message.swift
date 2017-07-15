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
	var senderUsername: String
	var senderDisplayName: String
	var listing: Listing
	var messageContent: String
	var previousMessage: Message?
	var nextMessage: Message?
	
	//MARK: Initialization
	init(senderUsername: String, listing: Listing, previousMessage: Message?) {
		self.senderUsername = senderUsername
		self.listing = listing
		
		if (previousMessage != nil) {
			self.previousMessage = previousMessage
			previousMessage?.nextMessage = self
		}
	}
}
