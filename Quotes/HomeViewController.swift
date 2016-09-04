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
	var testUser1: QuoteUser!				// Test
	var testUser2: QuoteUser!				// Data
	var testQuote1: QuoteQuote!				// To
	var testQuote2: QuoteQuote!				// Delete
	
	let rootRef = FIRDatabase.database().reference()
	let quoteRef = FIRDatabase.database().reference().child("QuoteQuote")
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = UIColor.quotesBackgroundColor()
		tableView.registerClass(QuoteTableViewCell.self, forCellReuseIdentifier: QuoteTableViewCell.cellIdentifier)
		tableView.separatorStyle = .None
		tableView.allowsSelection = false
		
//		generateTestData()
		fetchPostsData()
		
		
		//***Manually push data to FIRDatabase***
		
//		let authorId = testQuote2.authorId
//		let author = testQuote2.author
//		let content = testQuote2.content
//		let heardBy = testQuote2.heardBy
//		let date = String(testQuote2.date)
//		let newQuoteRef = quoteRef.childByAutoId()
//		
//		newQuoteRef.child("authorId").setValue(authorId)
//		newQuoteRef.child("content").setValue(content)
//		newQuoteRef.child("author").setValue(author)
//		newQuoteRef.child("heardBy").setValue(heardBy)
//		newQuoteRef.child("date").setValue(date)
		
//		quoteRef.childByAutoId().setValue(content, forKey: "content")
//		quoteRef.childByAutoId().setValue(author, forKey: "author")
//		quoteRef.childByAutoId().setValue(heardBy, forKey: "heardBy")
//		quoteRef.childByAutoId().setValue(date, forKey: "date")

	}
	
	func fetchPostsData() {
		print("fetching posts from database")
		
		self.shared.posts.removeAll()
		quoteRef.observeEventType(.ChildAdded, withBlock: { snapshot in
			print(snapshot)
			if let dict = snapshot.value as? [String: AnyObject] {
				let authorId = dict["authorId"] as! String
				let author = dict["author"] as! String
				let content = dict["content"] as! String
				let date = dict["date"] as! String
				let heardBy = dict["heardBy"] as! NSArray			//Still crashing here
					
				print (heardBy)
				print ("after")
				
				
				self.shared.posts.insert((QuoteQuote(authorId: authorId, author: author, heardBy: heardBy as? [String], content: content, date: date)), atIndex: 0)
				self.tableView.reloadData()
			}
		})
	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return shared.posts.count
	}
	
	override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return (view.frame.height / 4)
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCellWithIdentifier(QuoteTableViewCell.cellIdentifier, forIndexPath: indexPath) as! QuoteTableViewCell
		
		let post = shared.posts[indexPath.row]
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

		return cell
	}

	func searchButtonPressed() {
		
	}
	
//	func generateTestData() {
//		print("generating test data")
//		
//		testUser1 = QuoteUser(name: "David", phoneNumber: "3233233233", contacts: [], picture: "defaultPicture")
//		testUser2 = QuoteUser(name: "Joe", phoneNumber: "2322322322", contacts: [testUser1], picture: "defaultPicture")
//		
//		testQuote1 = QuoteQuote(authorId: "3233273655", author: testUser1.name, heardBy: [testUser2.phoneNumber!, "1111111111"], content: "HELLO", date: "12/11/1991")
//		testQuote2 = QuoteQuote(authorId: "1112223333", author: testUser2.name, heardBy: [testUser1.phoneNumber!, "1111111111"], content: "YOYO", date: "3/3/2005")
//	}
	
}

extension HomeViewController: QuoteTableViewCellDelegate {
	
	func profilePictureTapped() {
		let userProfileVC = ProfileViewController()
		presentViewController(userProfileVC, animated: true, completion: nil)
	}
}
