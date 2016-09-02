//
//  UIViewExtension.swift
//  Quotes
//
//  Created by David Park on 9/2/16.
//  Copyright © 2016 DavidVY. All rights reserved.
//

import UIKit

extension UIView {
	
	func buttonBounce() {
		
		UIView.animateWithDuration(0.05, animations: {
			self.transform = CGAffineTransformMakeScale(0.9, 0.9)
			}) { (finish) in
				UIView.animateWithDuration(0.2, animations: {
					self.transform = CGAffineTransformIdentity
				})
		}
	}
}
