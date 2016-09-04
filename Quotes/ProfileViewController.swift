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
	
	override func viewWillAppear(animated: Bool) {
		filterQuotePosts()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		filterQuotePosts()
		
		tableView.allowsSelection = false
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
		return postsArray.count + 1
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
			headerCell.delegate = self
			
			return headerCell
		} else {
			let cell = tableView.dequeueReusableCellWithIdentifier(QuoteTableViewCell.cellIdentifier, forIndexPath: indexPath) as! QuoteTableViewCell
			
			let post = postsArray[indexPath.row - 1]
			var heardByString = ""
			
			let picture = shared.userDataDict[post.authorId]!["picture"] as! String
			cell.profilePic.setImage(UIImage(named:picture)?.circle, forState: .Normal)
			cell.usernameLabel.text = post.author
			cell.quoteBoxLabel.text = post.content
			cell.dateLabel.text = post.date
			
			for id in post.heardBy {
				
				heardByString.appendContentsOf(shared.userDataDict[id]!["name"] as! String)
				heardByString.appendContentsOf(", ")
			}
			heardByString = heardByString.substringToIndex(heardByString.endIndex.advancedBy(-2))
			cell.heardPersonLabel.text = heardByString
			
			return cell
		}
	}
	
	func filterQuotePosts() {
		saidByArray.removeAll()
		heardByArray.removeAll()
		for post in shared.posts {
			if post.authorId == shared.currentUser {
				saidByArray.append(post)
			} else if post.heardBy.contains(shared.currentUser) {
				heardByArray.append(post)
			}
		}
		tableView.reloadData()
	}

}

extension ProfileViewController: ProfileHeaderCellDelegate {
	
	func changeView(sender: UISegmentedControl) {
		switch sender.selectedSegmentIndex {
		case 0:
			print("Segment Changed to Said By")
			postsArray = saidByArray
		default:
			print("Segment Changed to Heard By")
			postsArray = heardByArray
		}
		tableView.reloadData()
	}
	
	func logoutButtonPressed() {
		print("Logout Button Pressed")
		
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let loginVC = storyboard.instantiateViewControllerWithIdentifier("LoginVC") 
		let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
		appDelegate.window?.rootViewController = loginVC
	
	}
	
}
