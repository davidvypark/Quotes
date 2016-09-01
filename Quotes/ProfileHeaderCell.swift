//
//  ProfileHeaderCell.swift
//  Quotes
//
//  Created by David Park on 8/29/16.
//  Copyright © 2016 DavidVY. All rights reserved.
//

import UIKit
import SnapKit

protocol ProfileHeaderCellDelegate: class {
	func changeView(sender: UISegmentedControl)
	func logoutButtonPressed()
}

class ProfileHeaderCell: UITableViewCell {
	
	weak var delegate: ProfileHeaderCellDelegate?
	static let cellIdentifier = "ProfileHeaderCell"
	
	let profilePicture = UIImageView()
	let logoutButton = UIButton()
	let usernameLabel = UILabel()
	let customSC = UISegmentedControl(items: ["Said By", "Heard By"])
	
	override func layoutSubviews() {
		super.layoutSubviews()
		self.backgroundColor = UIColor.quotesBackgroundColor()
		
		setupCell()
		setupSegments()
	}
	
	func setupCell() {
		
		addSubview(profilePicture)
		profilePicture.snp_makeConstraints { (make) in
			make.centerX.equalTo(self.snp_centerX)
			make.centerY.equalTo(self.snp_centerY).dividedBy(1.15)
			make.height.equalTo(self.snp_width).dividedBy(3.2)
			make.width.equalTo(self.snp_width).dividedBy(3.2)
		}
		profilePicture.image = UIImage(named: "profilePic")?.circle
		
		addSubview(logoutButton)
		logoutButton.snp_makeConstraints { (make) in
			make.centerX.equalTo(profilePicture.snp_centerX)
			make.centerY.equalTo(self.snp_centerY).multipliedBy(1.55)
			make.width.equalTo(profilePicture.snp_width)
			make.height.equalTo(profilePicture.snp_width).dividedBy(2.5)
		}
		logoutButton.backgroundColor = UIColor.whiteColor()
		logoutButton.layer.borderWidth = 1.5
		logoutButton.layer.borderColor = UIColor.peterRiverColor().CGColor
		logoutButton.setTitle("Logout", forState: .Normal)
		logoutButton.setTitleColor(UIColor.peterRiverColor(), forState: .Normal)
		logoutButton.layer.cornerRadius = self.frame.width / 16
		logoutButton.addTarget(self, action: #selector(ProfileViewController.logoutButtonPressed), forControlEvents: .TouchUpInside)
		
		addSubview(usernameLabel)
		usernameLabel.snp_makeConstraints { (make) in
			make.centerX.equalTo(self.snp_centerX)
			make.centerY.equalTo(self.snp_centerY).dividedBy(3.5)
			make.width.equalTo(self.snp_width)
		}
		usernameLabel.text = "DAVID"
		usernameLabel.textAlignment = .Center
		usernameLabel.font = UIFont(name: Constants.headerFont, size: 25)
		usernameLabel.textColor = UIColor.peterRiverColor()
	}
	
	func setupSegments() {
		
		//customSC.selectedSegmentIndex = 0
		
		addSubview(customSC)
		customSC.snp_makeConstraints { (make) in
			make.centerX.equalTo(self.snp_centerX)
			make.width.equalTo(self.snp_width)
			make.height.equalTo(logoutButton.snp_height).dividedBy(1.5)
			make.bottom.equalTo(self.snp_bottom)
		}
		customSC.addTarget(self, action: #selector(changeSegment), forControlEvents: .ValueChanged)
		customSC.backgroundColor = UIColor.whiteColor()
		customSC.tintColor = UIColor.peterRiverColor()
	}
	
	func logoutButtonPressed() {
		delegate?.logoutButtonPressed()
	}
	
	func changeSegment() {
		delegate?.changeView(customSC)
	}
	
}
