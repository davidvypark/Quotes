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
	
	
	static let cellIdentifier = "QuoteTableViewCell"
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		setupCell()
	}
	
	func setupCell() {
		self.backgroundColor = UIColor.darkGrayColor()
		
		addSubview(quoteBoxLabel)
		quoteBoxLabel.snp_makeConstraints { (make) in
			make.centerY.equalTo(self.snp_centerY)
			make.centerX.equalTo(snp_centerX).multipliedBy(1.1)
			make.width.equalTo(self.snp_width).multipliedBy(0.67)
			make.height.equalTo(self.snp_height).dividedBy(2)		//eventually needs to be dynamic based off content
		}
		quoteBoxLabel.backgroundColor = UIColor.alizarinColor()
		
		addSubview(heardByLabel)
		heardByLabel.snp_makeConstraints { (make) in
			make.left.equalTo(quoteBoxLabel.snp_left)
			make.top.equalTo(quoteBoxLabel.snp_bottom).offset(5)
			make.width.equalTo(quoteBoxLabel.snp_width).dividedBy(3)
		}
		heardByLabel.backgroundColor = UIColor.amethystColor()
		heardByLabel.text = "Heard by:"

		addSubview(heardPersonLabel)
		heardPersonLabel.snp_makeConstraints { (make) in
			make.left.equalTo(heardByLabel.snp_right).offset(5)
			make.top.equalTo(heardByLabel.snp_top)
			make.width.equalTo(quoteBoxLabel.snp_width).multipliedBy(0.65)
		}
		heardPersonLabel.backgroundColor = UIColor.asbestosColor()
		heardPersonLabel.text = "Mark Zuckerberg"

		addSubview(profilePic)
		profilePic.snp_makeConstraints { (make) in
			make.centerY.equalTo(quoteBoxLabel.snp_top)
			make.centerX.equalTo(self.snp_centerX).dividedBy(4.5)
			make.width.equalTo(self.snp_width).dividedBy(6)
			make.height.equalTo(self.snp_width).dividedBy(6)
		}
		profilePic.backgroundColor = UIColor.belizeHoleColor()

		addSubview(usernameLabel)
		usernameLabel.snp_makeConstraints { (make) in
			make.bottom.equalTo(quoteBoxLabel.snp_top).offset(-5)
			make.left.equalTo(profilePic.snp_right).offset(5)
			make.width.equalTo(quoteBoxLabel).multipliedBy(0.8)
		}
		usernameLabel.backgroundColor = UIColor.carrotColor()
		usernameLabel.text = "David Park"

		addSubview(dateLabel)
		dateLabel.snp_makeConstraints { (make) in
			make.centerY.equalTo(usernameLabel.snp_centerY)
			make.centerX.equalTo(quoteBoxLabel.snp_right)
			make.width.equalTo(self.snp_width).dividedBy(7)
		}
		dateLabel.backgroundColor = UIColor.concreteColor()
		dateLabel.text = "12/11/16"
		dateLabel.adjustsFontSizeToFitWidth = true
		
	}

	
	
	
	
	
	
	
	
	
	
	
}
