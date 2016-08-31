//
//  UserDataStore.swift
//  Quotes
//
//  Created by David Park on 8/30/16.
//  Copyright © 2016 DavidVY. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

class UserDataStore {
	static let sharedDataStore = UserDataStore()
	
	var firstName: String?
	var lastName: String?
	var profilePicture: UIImage?
	var phoneNumber: String?
	
	var posts = [QuoteQuote]()
	
	var quoteRef = FIRDatabase.database().reference().child("QuoteQuote")
	var userRef = FIRDatabase.database().reference().child("QuoteUser")
	
	func fetchPostsData() {
		quoteRef.observeEventType(.ChildAdded, withBlock: { snapshot in
			if let dict = snapshot.value as? [String: AnyObject] {
				let author = dict["Author"] as! QuoteUser
				let heardBy = dict["heardBy"] as! [QuoteUser]
				let content = dict["content"] as! String
				let date = dict["date"] as! String			//This should be a String
				
				self.posts.append(QuoteQuote(author: author, heardBy: heardBy, content: content, date: date))
			}
		})
	}
	
//	func fetchUsersData() {
//		userRef.observeEventType(.ChildAdded, withBlock: { snapshot in
//			if let dict = snapshot.value as? [String: AnyObject] {
//				let userId = dict["userId"] as! String
//				let name = dict["name"] as! String
//				let phoneNumber = dict["phoneNumber"] as! String
//				let contactIds = dict["contacts"] as! [String]
//				
//			}
//		})
//	}
	
}
