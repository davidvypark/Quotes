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
	
	var testUser1: QuoteUser!				// Test
	var testUser2: QuoteUser!				// Data
	var testQuote1: QuoteQuote!				// To
	var testQuote2: QuoteQuote!				// Delete
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = UIColor.quotesBackgroundColor()
		tableView.registerClass(QuoteTableViewCell.self, forCellReuseIdentifier: QuoteTableViewCell.cellIdentifier)
		tableView.separatorStyle = .None
		let rootRef = FIRDatabase.database().reference()
		let quoteRef = rootRef.child("QuoteQuote")
		
		generateTestData()
		
		//quoteRef.childByAutoId().setValue(testQuote1)
		//quoteRef.childByAutoId().setValue("Hello from the other side")
		
		let author = testQuote1.author.userId
		let content = testQuote1.content
		var heardBy = [String]()
		let date = String(testQuote1.date)
		
		for user in testQuote1.heardBy! {
			heardBy.append(user.userId!)
		}
		
		quoteRef.child("content").setValue(content)
		quoteRef.child("author").setValue(author)
		quoteRef.child("heardBy").setValue(heardBy)
		quoteRef.child("date").setValue(date)
		
		
//		quoteRef.childByAutoId().setValue(content, forKey: "content")
//		quoteRef.childByAutoId().setValue(author, forKey: "author")
//		quoteRef.childByAutoId().setValue(heardBy, forKey: "heardBy")
//		quoteRef.childByAutoId().setValue(date, forKey: "date")

	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}
	
	override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return (view.frame.height / 4)
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCellWithIdentifier(QuoteTableViewCell.cellIdentifier, forIndexPath: indexPath) as! QuoteTableViewCell
		
		return cell
	}
	
	func searchButtonPressed() {
		
	}
	
	func generateTestData() {
		
		testUser1 = QuoteUser(userId: "asd", name: "David", phoneNumber: "3233233233", contacts: [])
		testUser2 = QuoteUser(userId: "blah", name: "Joe", phoneNumber: "2322322322", contacts: [testUser1])
		
		testQuote1 = QuoteQuote(author: testUser1, heardBy: [testUser2], content: "HELLO", date: NSDate(timeIntervalSinceReferenceDate: 0))
		testQuote2 = QuoteQuote(author: testUser2, heardBy: [testUser1], content: "YOYO", date: NSDate(timeIntervalSinceReferenceDate: 0))
	}

}
