//
//  QuoteTableViewCell.swift
//  Quotes
//
//  Created by David Park on 8/28/16.
//  Copyright © 2016 DavidVY. All rights reserved.
//

import UIKit
import SnapKit

class QuoteTableViewCell: UITableViewCell {
	
	let profilePic = UIImageView()
	let usernameLabel = UILabel()
	let quoteBoxLabel = UILabel()
	let dateLabel = UILabel()
	let heardByLabel = UILabel()
	let heardPersonLabel = UILabel()
	
	
	let cellIdentifier = "QuoteTablewViewCell"
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		setupCell()
	}
	
	func setupCell() {
		
		addSubview(quoteBoxLabel)
		
		addSubview(heardByLabel)
		
		addSubview(heardPersonLabel)
		
		addSubview(profilePic)
		
		addSubview(usernameLabel)
		
		addSubview(dateLabel)
	}

}
