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
		
		setupCell()
	}
	
	func setupCell() {
		
		addSubview(profilePicture)
		profilePicture.snp_makeConstraints { (make) in
			make.center.equalTo(self.snp_center)
			make.height.equalTo(self.snp_width).dividedBy(3)
			make.width.equalTo(self.snp_width).dividedBy(3)
		}
		profilePicture.image = UIImage(named: "profilePic")?.circle
		
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
			make.centerX.equalTo(self.snp_centerX)
			make.centerY.equalTo(self.snp_centerY).dividedBy(3)
			make.width.equalTo(self.snp_width)
		}
		usernameLabel.backgroundColor = UIColor.carrotColor()
		usernameLabel.text = "DAVID"
		usernameLabel.textAlignment = .Center
		usernameLabel.font = UIFont(name: Constants.headerFont, size: 30)
		usernameLabel.textColor = UIColor.whiteColor()
		
		
		
		
	}
}
