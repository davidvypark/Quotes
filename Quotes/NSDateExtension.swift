//
//  NSDateExtension.swift
//  Quotes
//
//  Created by David Park on 9/4/16.
//  Copyright © 2016 DavidVY. All rights reserved.
//

import Foundation

extension NSDate {
	
	func hour() -> Int {
		let calendar = NSCalendar.currentCalendar()
		let components = calendar.components(.Hour, fromDate: self)
		let hour = components.hour
		
		return hour
	}
	
	func minute() -> Int {
		let calendar = NSCalendar.currentCalendar()
		let components = calendar.components(.Minute, fromDate: self)
		let minute = components.minute
		
		return minute
	}
	
	func day() -> Int {
		let calendar = NSCalendar.currentCalendar()
		let day = calendar.component(.Day, fromDate: self)
		
		return day
	}
	
	func month() -> Int {
		let calendar = NSCalendar.currentCalendar()
		let month = calendar.component(.Month, fromDate: self)
		
		return month
	}
	
	func year() -> Int {
		let calendar = NSCalendar.currentCalendar()
		let year = calendar.component(.Year, fromDate: self)
		
		return year
	}
	
	func toShortTimeString() -> String {
		//Get Short Time String
		let formatter = NSDateFormatter()
		formatter.timeStyle = .ShortStyle
		let timeString = formatter.stringFromDate(self)
		
		//Return Short Time String
		return timeString
	}
}