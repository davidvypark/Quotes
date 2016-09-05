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
import AddressBook
import Contacts

class UserDataStore {
	static let sharedDataStore = UserDataStore()
	
	var firstName: String?
	var lastName: String?
	var profilePicture: UIImage?
	var phoneNumber: String?
	var currentUser: String!
	
	var posts = [QuoteQuote]()
	var validPhoneNumbers = [String]()
	var userDataDict = Dictionary<String, AnyObject>()
	var userContacts = [String]()
	
	var quoteRef = FIRDatabase.database().reference().child("QuoteQuote")
	var userRef = FIRDatabase.database().reference().child("QuoteUser")
	
	func fetchValidPhoneNumbers() {
		
		print ("fetching validPhoneNumber")
		validPhoneNumbers.removeAll()
		userRef.observeEventType(.ChildAdded, withBlock: { (snapshot) in
			self.validPhoneNumbers.append(snapshot.key)
			self.userDataDict[snapshot.key] = snapshot.value
			print (self.userDataDict)
			print (self.validPhoneNumbers)
		})
	}
	
	
//	func fetchPostsData(completion:() -> ()) {
//		quoteRef.observeEventType(.ChildAdded, withBlock: { snapshot in
//			print(snapshot)
//			if let dict = snapshot.value as? [String: AnyObject] {
//				let authorId = dict["authorId"] as! String
//				let author = dict["author"] as! String
//				let heardBy = dict["heardBy"] as! [String]
//				let content = dict["content"] as! String
//				let date = dict["date"] as! String			//This should be a String
//				
//				self.posts.append(QuoteQuote(authorId: authorId, author: author, heardBy: heardBy, content: content, date: date))
//			}
//			print("These are posts \(self.posts)")
//		})
//	}
	
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
	
	func fetchContacts() {
		
		print ("fetching contacts")
		
		let contactStore = CNContactStore()
		let keysToFetch = [
			CNContactFormatter.descriptorForRequiredKeysForStyle(.FullName),
			CNContactPhoneNumbersKey]
		
		var allContainers: [CNContainer] = []
		do {
			allContainers = try contactStore.containersMatchingPredicate(nil)
		} catch {
			print ("Error fetching containers")
		}
		
		for container in allContainers {
			let fetchPredicate = CNContact.predicateForContactsInContainerWithIdentifier(container.identifier)
			
			do {
				let containerResults = try contactStore.unifiedContactsMatchingPredicate(fetchPredicate, keysToFetch: keysToFetch)
				for contact in containerResults {
					if (!contact.phoneNumbers.isEmpty){
						let number = (contact.phoneNumbers[0].value as! CNPhoneNumber).valueForKey("digits") as! String
						if number.characters.count > 9 {
							let tenDigits = number.phoneNumberLength()
							userContacts.append(tenDigits)
						}
					}
				}
			} catch {
				print("Error fetching results for container")
			}
		}
		print (userContacts)
	}
	
}
