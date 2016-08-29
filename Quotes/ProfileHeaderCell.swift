//
//  ProfileHeaderCell.swift
//  Quotes
//
//  Created by David Park on 8/29/16.
//  Copyright © 2016 DavidVY. All rights reserved.
//

import UIKit

class ProfileHeaderCell: UITableViewCell {
	
	static let cellIdentifier = "ProfileHeaderCell"
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		self.backgroundColor = UIColor.cyanColor()
	}
}
