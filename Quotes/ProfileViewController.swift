//
//  ProfileViewController.swift
//  Quotes
//
//  Created by David Park on 8/28/16.
//  Copyright © 2016 DavidVY. All rights reserved.
//

import UIKit

class ProfileViewController: UITableViewController {
	
	var parentNavigationController: UINavigationController?
	private let headerIdentifier = "header"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.separatorStyle = .None
		tableView.registerClass(QuoteTableViewCell.self, forCellReuseIdentifier: QuoteTableViewCell.cellIdentifier)
		tableView.registerClass(ProfileHeaderCell.self, forCellReuseIdentifier: ProfileHeaderCell.cellIdentifier)
		
		view.backgroundColor = UIColor.quotesBackgroundColor()
	}
	
	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}
	
	override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		if indexPath.row == 0 {
			return (self.view.frame.height/2)
		}
		return (self.view.frame.height/3)
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		var cell = UITableViewCell()
		
		if indexPath.row == 0 {
			cell = tableView.dequeueReusableCellWithIdentifier(ProfileHeaderCell.cellIdentifier, forIndexPath: indexPath) as! ProfileHeaderCell
		} else {
			cell = tableView.dequeueReusableCellWithIdentifier(QuoteTableViewCell.cellIdentifier, forIndexPath: indexPath) as! QuoteTableViewCell
		}

		return cell
	}
	
}
