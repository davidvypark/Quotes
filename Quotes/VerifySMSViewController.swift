//
//  VerifySMSViewController.swift
//  Quotes
//
//  Created by David Park on 9/2/16.
//  Copyright © 2016 DavidVY. All rights reserved.
//

import UIKit

class VerifySMSViewController: UIViewController {
	
	let codeTextField = UITextField()
	let statusLabel = UILabel()
	let verifyButton = UIButton()
	let tryAgainTextField = UITextField()
	let tryAgainLabel = UILabel()
	
	override func viewDidLoad() {
		super.viewDidLoad()

		setupScene()
	}
	
	func setupScene() {
		
		view.backgroundColor = UIColor.quotesBackgroundColor()
		
		view.addSubview(statusLabel)
		statusLabel.snp_makeConstraints { (make) in
			make.width.equalTo(view.snp_width)
			make.height.equalTo(view.snp_height).dividedBy(10)
			make.center.equalTo(view.snp_center)
		}
		statusLabel.backgroundColor = UIColor.alizarinColor()
		
		view.addSubview(verifyButton)
		verifyButton.snp_makeConstraints { (make) in
			make.width.equalTo(view.snp_width).dividedBy(2)
			make.height.equalTo(view.snp_height).dividedBy(10)
			make.centerX.equalTo(view.snp_centerX)
			make.centerY.equalTo(view.snp_centerY).dividedBy(1.5)
		}
		verifyButton.backgroundColor = UIColor.peterRiverColor()
		verifyButton.addTarget(self, action: #selector(verifyButtonPressed), forControlEvents: .TouchUpInside)
		verifyButton.setTitle("Verify Code", forState: .Normal)
		verifyButton.layer.cornerRadius = view.frame.height / 20
		verifyButton.titleLabel?.font = UIFont(name: Constants.headerFont, size: 20)
		
		view.addSubview(codeTextField)
		codeTextField.snp_makeConstraints { (make) in
			make.width.equalTo(verifyButton.snp_width)
			make.height.equalTo(verifyButton.snp_height)
			make.centerX.equalTo(verifyButton.snp_centerX)
			make.bottom.equalTo(verifyButton.snp_top).offset(-20)
		}
		codeTextField.backgroundColor = UIColor.whiteColor()
		codeTextField.layer.cornerRadius = view.frame.height / 40
		codeTextField.layer.borderWidth = 1
		codeTextField.layer.borderColor = UIColor.quotesBorderColor().CGColor
		codeTextField.font = UIFont(name: Constants.basicFont, size: 35)
		codeTextField.textAlignment = .Center
		codeTextField.keyboardType = .NumberPad
		// need to implement the thing where there is a number limit
	
	}
	
	func verifyButtonPressed() {
		
		verifyButton.buttonBounce()
		print("Verify Button Pressed")
		
		//if code is correct
		
//		let storyboard = UIStoryboard(name: "Main", bundle: nil)
//		let naviVC = storyboard.instantiateViewControllerWithIdentifier("NavigationVC") as! UINavigationController
//		let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//		appDelegate.window?.rootViewController = naviVC
		
		// set stored.currentUser to the phoneNumber and create a new user in firebase
		
		//else
		
		//StatusLabel.text = incorrect code
		
		
		
	}

}
