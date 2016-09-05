//
//  StringExtension.swift
//  Quotes
//
//  Created by David Park on 9/5/16.
//  Copyright © 2016 DavidVY. All rights reserved.
//

import Foundation

extension String {
	
	func phoneNumberLength()->String {
		return self.substringFromIndex(self.startIndex.advancedBy(self.characters.count - 10))
	}
}
