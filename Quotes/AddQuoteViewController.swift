//
//  AddQuoteViewController.swift
//  Quotes
//
//  Created by David Park on 8/28/16.
//  Copyright © 2016 DavidVY. All rights reserved.
//

import UIKit
import SnapKit

protocol AddQuoteViewControllerDelegate: class {
	func didPressDoneButton()
}

class AddQuoteViewController: UIViewController, UITextViewDelegate {
	
	var parentNavigationController: UINavigationController?
	
	let textBox = UITextView()
	let quoteItButton = UIButton()
	let charCountLabel = UILabel()
	
	override func viewDidAppear(animated: Bool) {
		textBox.becomeFirstResponder()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = UIColor.quotesBackgroundColor()
		textBox.delegate = self
		setupScene()
		//textView(textBox, shouldChangeTextInRange: NSMakeRange(0, 10), replacementText: "")
	}
	
	func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text:String) -> Bool {
		return textView.text.characters.count + (text.characters.count - range.length) <= 300
	}
	
	func textViewDidChange(textView: UITextView) {
		charCountLabel.text = String(300 - textBox.text.characters.count)
	}
	
	func setupScene() {
		
		view.addSubview(textBox)
		textBox.snp_makeConstraints { (make) in
			make.top.equalTo(view.snp_top).offset(20)
			make.left.equalTo(view.snp_left).offset(20)
			make.right.equalTo(view.snp_right).offset(-20)
			make.height.equalTo(view.snp_height).dividedBy(2)
		}
		textBox.backgroundColor = UIColor.whiteColor()
		textBox.font = UIFont(name: Constants.basicFont, size: 22)
		textBox.layer.borderWidth = 1.5
		textBox.layer.borderColor = UIColor.quotesBorderColor().CGColor
		textBox.textColor = Constants.textColor
		
		view.addSubview(quoteItButton)
		quoteItButton.snp_makeConstraints { (make) in
			make.top.equalTo(textBox.snp_bottom)
			make.right.equalTo(textBox.snp_right)
			make.width.equalTo(textBox.snp_width).dividedBy(3)
			make.height.equalTo(textBox.snp_width).dividedBy(10)
		}
		quoteItButton.addTarget(self, action: #selector(quoteItPressed), forControlEvents: .TouchUpInside)
		quoteItButton.setTitle("QUOTE IT", forState: .Normal)
		quoteItButton.titleLabel!.font = UIFont(name: Constants.headerFont, size: quoteItButton.titleLabel!.font.pointSize)
		quoteItButton.setTitleColor(UIColor.peterRiverColor(), forState: .Normal)
	
		view.addSubview(charCountLabel)
		charCountLabel.snp_makeConstraints { (make) in
			make.top.equalTo(quoteItButton.snp_top)
			make.left.equalTo(textBox.snp_left)
			make.height.equalTo(quoteItButton.snp_height)
			make.width.equalTo(quoteItButton.snp_width)
		}
		charCountLabel.text = "300"
		charCountLabel.textColor = UIColor.peterRiverColor()
	}

	func quoteItPressed() {
		
		print("quote it button pressed")
		
		let reviewVC = ReviewViewController()
		reviewVC.title = "REVIEW"
		reviewVC.quoteText = textBox.text
		parentNavigationController?.pushViewController(reviewVC, animated: true)
		
		//textBox.text = ""
	}
	
	func didPressDoneButton() {
		textBox.text = ""
	}



}
