//
//  AddQuoteViewController.swift
//  Quotes
//
//  Created by David Park on 8/28/16.
//  Copyright © 2016 DavidVY. All rights reserved.
//

import UIKit
import SnapKit

class AddQuoteViewController: UIViewController {
	
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
		setupScene()
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
		//quoteItButton.backgroundColor = UIColor.amethystColor()
		quoteItButton.addTarget(self, action: #selector(quoteItPressed), forControlEvents: .TouchUpInside)
		quoteItButton.setTitle("QUOTE IT", forState: .Normal)
		quoteItButton.titleLabel!.font = UIFont(name: Constants.headerFont, size: quoteItButton.titleLabel!.font.pointSize)
		quoteItButton.setTitleColor(Constants.textColor, forState: .Normal)
	
		view.addSubview(charCountLabel)
		charCountLabel.snp_makeConstraints { (make) in
			make.top.equalTo(quoteItButton.snp_top)
			make.left.equalTo(textBox.snp_left)
			make.height.equalTo(quoteItButton.snp_height)
			make.width.equalTo(quoteItButton.snp_width)
		}
		charCountLabel.text = "300"
		//charCountLabel.backgroundColor = UIColor.alizarinColor()
		charCountLabel.textColor = Constants.textColor
	}

	func quoteItPressed() {
		
		print("quote it button pressed")
		
		let reviewVC = ReviewViewController()
		reviewVC.title = "REVIEW"
		parentNavigationController?.pushViewController(reviewVC, animated: true)
		

	}







}
