//
//  AddQuoteViewController.swift
//  Quotes
//
//  Created by David Park on 8/28/16.
//  Copyright © 2016 DavidVY. All rights reserved.
//

import UIKit
import SnapKit

class AddQuoteViewController: UIViewController, UITextViewDelegate {
	
	var parentNavigationController: UINavigationController?
	
	let textBox = UITextView()
	let quoteItButton = UIButton()
	let charCountLabel = UILabel()
	let resetButton = UIButton()
	
	override func viewDidAppear(animated: Bool) {
		textBox.becomeFirstResponder()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = UIColor.quotesBackgroundColor()
		textBox.delegate = self
		setupScene()
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
		
		view.addSubview(resetButton)
		resetButton.snp_makeConstraints { (make) in
			make.bottom.equalTo(textBox.snp_bottom).offset(-10)
			make.left.equalTo(textBox.snp_left)
			make.height.equalTo(textBox.snp_height).dividedBy(10)
			make.width.equalTo(textBox.snp_width).dividedBy(4)
		}
		//resetButton.backgroundColor = UIColor.alizarinColor()
		resetButton.setTitle("clear", forState: .Normal)
		resetButton.setTitleColor(UIColor.silverColor(), forState: .Normal)
		resetButton.titleLabel!.font = UIFont(name: Constants.headerFont, size: 20)
		resetButton.addTarget(self, action: #selector(resetButtonPressed), forControlEvents: .TouchUpInside)
	}

	func quoteItPressed() {
		
		quoteItButton.buttonBounce()
		
		if (textBox.text.isEmpty) {
			let alertController = UIAlertController(title: "Oops", message: "Please write a quote", preferredStyle: .Alert)
			let OKAction = UIAlertAction(title: "OK", style: .Default, handler: { (action) in })
			
			alertController.addAction(OKAction)
			presentViewController(alertController, animated: true, completion: nil)
			
		} else {
			
			print("quote it button pressed")
			
			let reviewVC = ReviewViewController()
			reviewVC.title = "REVIEW"
			reviewVC.quoteText = textBox.text
			parentNavigationController?.pushViewController(reviewVC, animated: true)
		}
	}
	
	func didPressDoneButton() {
		textBox.text = ""
	}
	
	func resetButtonPressed() {
		resetButton.buttonBounce()
		textBox.text = ""
		charCountLabel.text = "300"
	}



}
