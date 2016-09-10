//
//  HomeViewController.swift
//  Quotes
//
//  Created by David Park on 8/28/16.
//  Copyright © 2016 DavidVY. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class HomeViewController: UITableViewController {
	
	var parentNavigationController: UINavigationController?
	
	var shared = UserDataStore.sharedDataStore
	var filteredPosts = [QuoteQuote]()
	var testUser1: QuoteUser!				// Test
	var testUser2: QuoteUser!				// Data
	var testQuote1: QuoteQuote!				// To
	var testQuote2: QuoteQuote!				// Delete
	
	let rootRef = FIRDatabase.database().reference()
	let quoteRef = FIRDatabase.database().reference().child("QuoteQuote")

	override func viewDidLoad() {
		super.viewDidLoad()
		
//		shared.currentUser = "3333333333"			//TEMP to bypass login screen
//		shared.fetchValidPhoneNumbers()				//xxxxx
//		shared.fetchContacts()						//xxxxx
		
		view.backgroundColor = UIColor.quotesBackgroundColor()
		tableView.registerClass(QuoteTableViewCell.self, forCellReuseIdentifier: QuoteTableViewCell.cellIdentifier)
		tableView.separatorStyle = .None
		tableView.allowsSelection = false
		tableView.rowHeight = UITableViewAutomaticDimension
		tableView.estimatedRowHeight = view.frame.height / 4
		
		
		addContactsToUserDataDict()
		fetchPostsData { 
			self.filterPosts()
		}

	}
	
	func fetchPostsData(completion: ()-> ()) {
		print("fetching posts from database")
		
		self.shared.posts.removeAll()
		quoteRef.observeEventType(.ChildAdded, withBlock: { snapshot in
			print(snapshot)
			if let dict = snapshot.value as? [String: AnyObject] {
				let authorId = dict["authorId"] as! String
				let author = dict["author"] as! String
				let content = dict["content"] as! String
				let date = dict["date"] as! String
				let heardBy = dict["heardBy"] as! NSArray
					
				print (heardBy)
				print ("after")
				
				self.shared.posts.insert((QuoteQuote(authorId: authorId, author: author, heardBy: heardBy as? [String], content: content, date: date)), atIndex: 0)
				self.tableView.reloadData()
			}
			completion()
		})
	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return filteredPosts.count
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCellWithIdentifier(QuoteTableViewCell.cellIdentifier, forIndexPath: indexPath) as! QuoteTableViewCell
		
		let post = filteredPosts[indexPath.row]
		var heardByString = ""
		
		print(post)
		
		let picture = shared.userDataDict[post.authorId]!["picture"] as! String
		cell.profilePic.setImage(UIImage(named:picture)?.circle, forState: .Normal)
		cell.usernameLabel.text = post.author
		cell.quoteBoxLabel.text = post.content
		cell.dateLabel.text = post.date
		
		for id in post.heardBy {
			
			heardByString.appendContentsOf(shared.userDataDict[id]?["name"] as! String)
			heardByString.appendContentsOf(", ")
		}
		print (post.heardBy)
		heardByString = heardByString.substringToIndex(heardByString.endIndex.advancedBy(-2))
		cell.heardPersonLabel.text = heardByString
		
		cell.layoutIfNeeded()

		return cell
	}
	
	func filterPosts() {
		filteredPosts.removeAll()
		for post in shared.posts {
			if post.authorId == shared.currentUser || post.heardBy.contains(shared.currentUser) || shared.userContacts.values.contains(post.authorId) {
				filteredPosts.append(post)
			}
		}
		print ("filtered \(filteredPosts)")
	}
	
	func addContactsToUserDataDict() {
		for contactName in shared.userContacts.keys {
			var subDict = [String: String]()
			subDict["name"] = contactName
			subDict["picture"] = "defaultPicture"
			shared.userDataDict[shared.userContacts[contactName]!] = subDict
		}
	}

	func searchButtonPressed() {
		
	}
	
}

extension HomeViewController: QuoteTableViewCellDelegate {
	
	func profilePictureTapped() {
		let userProfileVC = ProfileViewController()
		presentViewController(userProfileVC, animated: true, completion: nil)
	}
}
