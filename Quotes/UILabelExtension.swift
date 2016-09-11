//
//  UILabelExtension.swift
//  Quotes
//
//  Created by David Park on 9/10/16.
//  Copyright © 2016 DavidVY. All rights reserved.
//

import UIKit


extension UILabel {
	func addImage(imageName: String) {
		let attachment:NSTextAttachment = NSTextAttachment()
		attachment.image = UIImage(named: imageName)
		
		let attachmentString:NSAttributedString = NSAttributedString(attachment: attachment)
		let myString:NSMutableAttributedString = NSMutableAttributedString(string: self.text!)
		myString.appendAttributedString(attachmentString)
		
		self.attributedText = myString
	}
}

