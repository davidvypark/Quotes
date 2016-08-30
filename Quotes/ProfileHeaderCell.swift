//
//  ProfileHeaderCell.swift
//  Quotes
//
//  Created by David Park on 8/29/16.
//  Copyright © 2016 DavidVY. All rights reserved.
//

import UIKit
import SnapKit

class ProfileHeaderCell: UITableViewCell {
	
	static let cellIdentifier = "ProfileHeaderCell"
	
	let profilePicture = UIImageView()
	let logoutButton = UIButton()
	let usernameLabel = UILabel()
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		self.backgroundColor = UIColor.cyanColor()
		setupCell()
	}
	
	func setupCell() {
		
		addSubview(profilePicture)
		profilePicture.snp_makeConstraints { (make) in
			make.center.equalTo(self.snp_center)
			make.height.equalTo(self.snp_width).dividedBy(3)
			make.width.equalTo(self.snp_width).dividedBy(3)
		}
		profilePicture.backgroundColor = UIColor.darkGrayColor()
		
		addSubview(logoutButton)
		logoutButton.snp_makeConstraints { (make) in
			make.centerX.equalTo(profilePicture.snp_centerX)
			make.centerY.equalTo(self.snp_centerY).multipliedBy(1.7)
			make.width.equalTo(profilePicture.snp_width)
			make.height.equalTo(profilePicture.snp_width).dividedBy(2.5)
		}
		logoutButton.backgroundColor = UIColor.emeraldColor()
		
		addSubview(usernameLabel)
		usernameLabel.snp_makeConstraints { (make) in
			make.centerX.equalTo(snp_centerX)
			make.centerY.equalTo(snp_centerY).dividedBy(2)
			make.width.equalTo(self.snp_width)
		}
		usernameLabel.backgroundColor = UIColor.carrotColor()
		
		
		
		
	}
}
