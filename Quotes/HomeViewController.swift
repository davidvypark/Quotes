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
		
		generateTestData()
		fetchPostsData()
		
		//quoteRef.childByAutoId().setValue(testQuote1)
		//quoteRef.childByAutoId().setValue("Hello from the other side")
		
//		let author = testQuote2.author.name
//		let content = testQuote2.content
//		let heardBy = testQuote2.heardBy
//		let date = String(testQuote2.date)
//		let newQuoteRef = quoteRef.childByAutoId()
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
		quoteRef.observeEventType(.ChildAdded, withBlock: { snapshot in
			print(snapshot)
			if let dict = snapshot.value as? [String: AnyObject] {
				let author = dict["author"] as! String
				let heardBy = dict["heardBy"] as! [String]
				let content = dict["content"] as! String
				let date = dict["date"] as! String			//This should be a String
				
				self.shared.posts.append(QuoteQuote(author: author, heardBy: heardBy, content: content, date: date))
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
		print (post)
		print (cell.usernameLabel.text)

		cell.profilePic.image = UIImage(named: "profilePic")
		cell.usernameLabel.text = post.author
		print(cell.usernameLabel.text)
		cell.quoteBoxLabel.text = post.content
		cell.dateLabel.text = String(post.date)
		
//		var heardPersons = [String]()
//		for user in post.heardBy! {
//			heardPersons.append(user.phoneNumber!)
//		}
//		cell.heardPersonLabel.text = heardPersons.joinWithSeparator(", ")
	
		return cell
	}

	func searchButtonPressed() {
		
	}
	
	func generateTestData() {
		
		testUser1 = QuoteUser(name: "David", phoneNumber: "3233233233", contacts: [])
		testUser2 = QuoteUser(name: "Joe", phoneNumber: "2322322322", contacts: [testUser1])
		
		testQuote1 = QuoteQuote(author: testUser1.name, heardBy: [testUser2.phoneNumber!], content: "HELLO", date: "12/11/1991")
		testQuote2 = QuoteQuote(author: testUser2.name, heardBy: [testUser1.phoneNumber!], content: "YOYO", date: "3/3/2005")
	}
	
}
