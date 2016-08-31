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
	static let shared = UserDataStore()
	
	var firstName: String?
	var lastName: String?
	var profilePicture: UIImage?
	var phoneNumber: String?
	
	var posts = [QuoteQuote]()
	
	var quoteRef = FIRDatabase.database().reference().child("QuoteQuote")
	
	func observeMessages() {
		quoteRef.observeEventType(.ChildAdded, withBlock: { snapshot in
			if let dict = snapshot.value as? [String: AnyObject] {
				let author = dict["Author"] as! QuoteUser
				let heardBy = dict["heardBy"] as! [QuoteUser]
				let content = dict["content"] as! String
				let date = dict["date"] as! NSDate
				
				self.posts.append(QuoteQuote(author: author, heardBy: heardBy, content: content, date: date))
			}
		})

	}
	
}
