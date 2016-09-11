//
//  QuoteTableViewCell.swift
//  Quotes
//
//  Created by David Park on 8/28/16.
//  Copyright © 2016 DavidVY. All rights reserved.
//

import UIKit
import SnapKit

protocol QuoteTableViewCellDelegate: class {
	func profilePictureTapped()
}

class QuoteTableViewCell: UITableViewCell {
	
	weak var delegate: QuoteTableViewCellDelegate?
	
	var profilePic = UIButton()
	var usernameLabel = UILabel()
	var quoteBoxLabel = UILabel()
	var dateLabel = UILabel()
	var heardByLabel = UILabel()
	var heardPersonLabel = UILabel()
	let startQuote = UIImageView()
	let endQuote = UIImageView()
	
	
	let box = UIView()
	
	static let cellIdentifier = "QuoteViewCell"
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		setupCell()
	}
	
	func setupCell() {
		self.backgroundColor = UIColor.whiteColor()
		
//		addSubview(box)
//		box.snp_makeConstraints { (make) in
//			make.left.equalTo(self.snp_left).offset(10)
//			make.top.equalTo(self.snp_top).offset(3)
//			make.bottom.equalTo(self.snp_bottom).offset(-3)
//			make.right.equalTo(self.snp_right).offset(-10)
//		}
//		box.backgroundColor = UIColor.whiteColor()
//		box.layer.borderWidth = 1.5
//		box.layer.borderColor = UIColor.quotesBorderColor().CGColor
		

		addSubview(profilePic)
		profilePic.snp_makeConstraints { (make) in
			make.top.equalTo(self.snp_top).offset(20)
			make.centerX.equalTo(self.snp_centerX).dividedBy(4.5)
			make.width.equalTo(self.snp_width).multipliedBy(0.11)
			make.height.equalTo(self.snp_width).dividedBy(9)
		}
		//profilePic.image = UIImage(named: "profilePic")?.circle
		profilePic.addTarget(self, action: #selector(profilePictureTapped), forControlEvents: .TouchUpInside)
		
		addSubview(startQuote)
		startQuote.snp_makeConstraints { (make) in
			make.top.equalTo(profilePic.snp_centerY).offset(1)
			make.left.equalTo(profilePic.snp_right).offset(7)
			make.width.equalTo(self.snp_width).multipliedBy(0.0584)
			make.height.equalTo(self.snp_width).multipliedBy(0.0584)
		}
		startQuote.image = UIImage(named: "leftQuotions")
		startQuote.contentMode = .ScaleAspectFit
		
		addSubview(quoteBoxLabel)
		quoteBoxLabel.snp_makeConstraints { (make) in
			make.top.equalTo(startQuote.snp_top)
			make.left.equalTo(startQuote.snp_right).offset(7)
//			make.centerY.equalTo(self.snp_centerY)
//			make.centerX.equalTo(snp_centerX).multipliedBy(1.1)
			make.width.equalTo(self.snp_width).multipliedBy(0.674)
			
		}
		quoteBoxLabel.backgroundColor = UIColor.whiteColor()
		quoteBoxLabel.lineBreakMode = .ByWordWrapping
		quoteBoxLabel.numberOfLines = 5
		quoteBoxLabel.font = UIFont(name: Constants.basicFont, size: quoteBoxLabel.font.pointSize)
		quoteBoxLabel.numberOfLines = 0
		
//		addSubview(heardByLabel)
//		heardByLabel.snp_makeConstraints { (make) in
//			make.left.equalTo(quoteBoxLabel.snp_left)
//			make.top.equalTo(quoteBoxLabel.snp_bottom).offset(15)
//			make.width.equalTo(quoteBoxLabel.snp_width).dividedBy(3)
//		}
//		//heardByLabel.backgroundColor = UIColor.amethystColor()
//		heardByLabel.text = "Heard by:"
		
		addSubview(heardPersonLabel)
		heardPersonLabel.snp_makeConstraints { (make) in
			make.left.equalTo(quoteBoxLabel.snp_left)
			make.top.equalTo(quoteBoxLabel.snp_bottom).offset(15)
			make.right.equalTo(quoteBoxLabel.snp_right)
			make.bottom.equalTo(self.snp_bottom).offset(-20)
		}
		//heardPersonLabel.backgroundColor = UIColor.asbestosColor()
		heardPersonLabel.numberOfLines = 0
		heardPersonLabel.lineBreakMode = .ByWordWrapping

		addSubview(usernameLabel)
		usernameLabel.snp_makeConstraints { (make) in
			make.top.equalTo(profilePic.snp_top)
			make.left.equalTo(profilePic.snp_right).offset(10)
			make.width.equalTo(quoteBoxLabel).multipliedBy(0.8)
		}
		//usernameLabel.backgroundColor = UIColor.carrotColor()
		//usernameLabel.text = "Antoine de Saint-Exupery"
		usernameLabel.font = UIFont(name: Constants.headerFont, size: usernameLabel.font.pointSize)

		addSubview(dateLabel)
		dateLabel.snp_makeConstraints { (make) in
			make.centerY.equalTo(usernameLabel.snp_centerY)
			make.right.equalTo(quoteBoxLabel.snp_right)
			make.width.equalTo(self.snp_width).multipliedBy(0.11)
		}
		//dateLabel.backgroundColor = UIColor.concreteColor()
		//dateLabel.text = "12/11/16"
		dateLabel.textColor = UIColor.quotesGrey()
		dateLabel.adjustsFontSizeToFitWidth = true
		
	}
	
	func profilePictureTapped() {
		print ("profile picture tapped")
		delegate?.profilePictureTapped()
		
	}
	
	func setupcCelll() {
		
		addSubview(profilePic)
	}
	
}
