//
//  CustomSearchBar.swift
//  Quotes
//
//  Created by David Park on 9/11/16.
//  Copyright © 2016 DavidVY. All rights reserved.
//

import UIKit

class CustomSearchBar: UISearchBar {
	
	var preferredFont: UIFont!
	
	var preferredTextColor: UIColor!
	
//	override func drawRect(rect: CGRect) {
//		if let index = indexOfSearchFieldInSubviews() {
//			let searchField: UITextField = (subviews[0] ).subviews[index] as! UITextField
//			searchField.frame = CGRectMake(5.0, 5.0, frame.size.width - 10.0, frame.size.height - 10.0)
//			searchField.font = preferredFont
//			searchField.textColor = preferredTextColor
//			searchField.backgroundColor = barTintColor
//		}
//		
//		let startPoint = CGPointMake(0.0, frame.size.height)
//		let endPoint = CGPointMake(frame.size.width, frame.size.height)
//		let path = UIBezierPath()
//		path.moveToPoint(startPoint)
//		path.addLineToPoint(endPoint)
//		
//		let shapeLayer = CAShapeLayer()
//		shapeLayer.path = path.CGPath
//		shapeLayer.strokeColor = preferredTextColor.CGColor
//		shapeLayer.lineWidth = 2.5
//		
//		layer.addSublayer(shapeLayer)
//		
//		super.drawRect(rect)
//	}
	
	
	
	init(frame: CGRect, font: UIFont, textColor: UIColor) {
		super.init(frame: frame)
		
		self.frame = frame
		preferredFont = font
		preferredTextColor = textColor
		
		searchBarStyle = UISearchBarStyle.Prominent
		translucent = false
	}
	
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	
	func indexOfSearchFieldInSubviews() -> Int! {
		
		var index: Int!
		let searchBarView = subviews[0]
		
		for i in 0 ..< searchBarView.subviews.count {
			if searchBarView.subviews[i].isKindOfClass(UITextField) {
				index = i
				break
			}
		}
		
		return index
	}
}
