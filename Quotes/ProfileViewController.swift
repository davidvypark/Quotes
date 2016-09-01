//
//  ProfileViewController.swift
//  Quotes
//
//  Created by David Park on 8/28/16.
//  Copyright © 2016 DavidVY. All rights reserved.
//

import UIKit

class ProfileViewController: UITableViewController {
	
	var shared = UserDataStore.sharedDataStore
	
	var parentNavigationController: UINavigationController?
	var saidByArray = [QuoteQuote]()
	var heardByArray = [QuoteQuote]()
	var postsArray = [QuoteQuote]()
	private let headerIdentifier = "header"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		filterQuotePosts()
		
		tableView.separatorStyle = .None
		tableView.registerClass(QuoteTableViewCell.self, forCellReuseIdentifier: QuoteTableViewCell.cellIdentifier)
		tableView.registerClass(ProfileHeaderCell.self, forCellReuseIdentifier: ProfileHeaderCell.cellIdentifier)
		view.backgroundColor = UIColor.quotesBackgroundColor()
		
		postsArray = saidByArray
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
		
		if indexPath.row == 0 {
			let headerCell = tableView.dequeueReusableCellWithIdentifier(ProfileHeaderCell.cellIdentifier, forIndexPath: indexPath) as! ProfileHeaderCell
			return headerCell
		} else {
			let cell = tableView.dequeueReusableCellWithIdentifier(QuoteTableViewCell.cellIdentifier, forIndexPath: indexPath) as! QuoteTableViewCell
			
//			let post = postsArray[indexPath.row]
//			
//			cell.profilePic.image = UIImage(named: "profilePic")?.circle
//			cell.usernameLabel.text = post.author
//			cell.quoteBoxLabel.text = post.content
//			cell.dateLabel.text = post.date
//			
			return cell
			
		}
	}
	
	func filterQuotePosts() {
//		for post in shared.posts {
//			if post.author = currentUser {
//				saidByArray.append(post)
//			} else if post.heardBy.contains(currentUser.phoneNumber) {
//				heardByArray.append(post)
//			}
//		}
	}



}

extension ProfileViewController: ProfileHeaderCellDelegate {
	
	func changeView(sender: UISegmentedControl) {
		switch sender.selectedSegmentIndex {
		case 0:
			postsArray = saidByArray
		default:
			postsArray = heardByArray
		}
		
		tableView.reloadData()
	}
}
