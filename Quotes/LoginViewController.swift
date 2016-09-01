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
	
	let shared = UserDataStore.sharedDataStore
	
	let createNewUserButton = UIButton()
	let phoneNumberTextField = UITextField()
	let firstNameField = UITextField()
	let lastNameField = UITextField()
	
	let loginWithPhoneNumberTextField = UITextField()
	let loginButton = UIButton()
	
	override func viewDidLoad() {
		super.viewDidLoad()
	
		setupScene()
	}

	func setupScene() {
		view.addSubview(phoneNumberTextField)
		phoneNumberTextField.snp_makeConstraints { (make) in
			make.centerY.equalTo(view.snp_centerY).dividedBy(1.5)
			make.centerX.equalTo(view.snp_centerX)
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
		
		view.addSubview(createNewUserButton)
		createNewUserButton.snp_makeConstraints { (make) in
			make.top.equalTo(phoneNumberTextField.snp_bottom).offset(20)
			make.width.equalTo(phoneNumberTextField.snp_width)
			make.centerX.equalTo(phoneNumberTextField.snp_centerX)
			make.height.equalTo(view.snp_height).dividedBy(20)
		}
		createNewUserButton.setTitle("Create New User", forState: .Normal)
		createNewUserButton.backgroundColor = UIColor.peterRiverColor()
		createNewUserButton.addTarget(self, action: #selector(createNewUserButtonPressed), forControlEvents: .TouchUpInside)
	
		view.addSubview(loginWithPhoneNumberTextField)
		loginWithPhoneNumberTextField.snp_makeConstraints { (make) in
			make.width.equalTo(createNewUserButton.snp_width)
			make.center.equalTo(view.snp_center)
			make.height.equalTo(createNewUserButton.snp_height)
		}
		loginWithPhoneNumberTextField.backgroundColor = UIColor.quotesBorderColor()
		loginWithPhoneNumberTextField.placeholder = "(###) ### #####"
		
		view.addSubview(loginButton)
		loginButton.snp_makeConstraints { (make) in
			make.width.equalTo(loginWithPhoneNumberTextField.snp_width)
			make.height.equalTo(loginWithPhoneNumberTextField.snp_height)
			make.centerX.equalTo(loginWithPhoneNumberTextField.snp_centerX)
			make.top.equalTo(loginWithPhoneNumberTextField.snp_bottom).offset(20)
		}
		loginButton.backgroundColor = UIColor.peterRiverColor()
		loginButton.setTitle("LOGIN", forState: .Normal)
		loginButton.addTarget(self, action: #selector(loginWithPhoneNumber), forControlEvents: .TouchUpInside)
		
	}
	
	func createNewUserButtonPressed() {
		//if phone number is valid
		
		let userRef = FIRDatabase.database().reference().child("QuoteUser")
		let newUserRef = userRef.child(phoneNumberTextField.text!)
		newUserRef.child("name").setValue(firstNameField.text! + " " + lastNameField.text!)
		
		shared.currentUser = phoneNumberTextField.text
		print("Current User is \(shared.currentUser)")
		
		goToPageMenu()
	}
	
	func loginWithPhoneNumber() {
		
		shared.currentUser = loginWithPhoneNumberTextField.text
		goToPageMenu()
	}
	
	func goToPageMenu() {
		
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let naviVC = storyboard.instantiateViewControllerWithIdentifier("NavigationVC") as! UINavigationController
		let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
		appDelegate.window?.rootViewController = naviVC
	
	}
}
