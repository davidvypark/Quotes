//
//  QuotesAPI.swift
//  Quotes
//
//  Created by David Park on 9/10/16.
//  Copyright © 2016 DavidVY. All rights reserved.
//

import Foundation

class QuotesAPI {
	
	class func getQOD(completion: (NSDictionary) -> ()) {
//		let url = NSURL(string: Secrets.qodURL)
//		let session = NSURLSession.sharedSession()
//		
//		guard let unwrappedURL = url else { fatalError("Invalid URL") }
//		let task = session.dataTaskWithURL(unwrappedURL) { (data, response, error) in
//			guard let data = data else {fatalError("Unable to get data \(error?.localizedDescription)") }
//			
//			do {
//				let responseData = try? NSJSONSerialization.JSONObjectWithData(data, options: []) as? NSDictionary
//				
//				if let responseData = responseData {
//					print(responseData)
//					completion(responseData!)
//				}
//			} catch {
//				print ("error")
//			}
//		}
//		task.resume()
	}
	
	class func getAuthors(completion: () -> ()) {
		
	}
	
	class func getQuotesForAuthor(author: String, completion: () -> ()) {
		
	}
	
}