//
//  LoginViewController.swift
//  Quotes
//
//  Created by David Park on 8/30/16.
//  Copyright © 2016 DavidVY. All rights reserved.
//

import UIKit
import SnapKit
import Firebase
import FirebaseDatabase

class LoginViewController: UIViewController {
	
	let loginButton = UIButton()
	let phoneNumberTextField = UITextField()
	let firstNameField = UITextField()
	let lastNameField = UITextField()
	
	override func viewDidLoad() {
		super.viewDidLoad()
	
		setupScene()
	}

	func setupScene() {
		view.addSubview(phoneNumberTextField)
		phoneNumberTextField.snp_makeConstraints { (make) in
			make.center.equalTo(view.snp_center)
			make.width.equalTo(view.snp_width).multipliedBy(0.35)
			make.height.equalTo(view.snp_height).dividedBy(20)
		}
		phoneNumberTextField.placeholder = "(###) ###-####"
		phoneNumberTextField.backgroundColor = UIColor.quotesBorderColor()
		
		view.addSubview(lastNameField)
		lastNameField.snp_makeConstraints { (make) in
			make.centerX.equalTo(phoneNumberTextField.snp_centerX)
			make.width.equalTo(phoneNumberTextField.snp_width)
			make.height.equalTo(phoneNumberTextField.snp_height)
			make.bottom.equalTo(phoneNumberTextField.snp_top).offset(-20)
		}
		lastNameField.backgroundColor = UIColor.quotesBorderColor()
		lastNameField.placeholder = " Last Name"
		
		view.addSubview(firstNameField)
		firstNameField.snp_makeConstraints { (make) in
			make.centerX.equalTo(lastNameField.snp_centerX)
			make.width.equalTo(lastNameField.snp_width)
			make.height.equalTo(lastNameField.snp_height)
			make.bottom.equalTo(lastNameField.snp_top).offset(-20)
		}
		firstNameField.backgroundColor = UIColor.quotesBorderColor()
		firstNameField.placeholder = " First Name"
		
		view.addSubview(loginButton)
		loginButton.snp_makeConstraints { (make) in
			make.top.equalTo(phoneNumberTextField.snp_bottom).offset(20)
			make.width.equalTo(phoneNumberTextField.snp_width).dividedBy(2)
			make.centerX.equalTo(phoneNumberTextField.snp_centerX)
			make.height.equalTo(view.snp_height).dividedBy(20)
		}
		loginButton.setTitle("LOGIN", forState: .Normal)
		loginButton.backgroundColor = UIColor.peterRiverColor()
		loginButton.addTarget(self, action: #selector(loginButtonPressed), forControlEvents: .TouchUpInside)
	
	}
	
	func loginButtonPressed() {
		//if phone number is valid
		
		let userRef = FIRDatabase.database().reference().child("QuoteUser")
		let newUserRef = userRef.child(phoneNumberTextField.text!)
		newUserRef.child("name").setValue(firstNameField.text! + " " + lastNameField.text!)
		
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let naviVC = storyboard.instantiateViewControllerWithIdentifier("NavigationVC") as! UINavigationController
		let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
		appDelegate.window?.rootViewController = naviVC
		
	}
}
