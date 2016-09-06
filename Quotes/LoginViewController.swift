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

class LoginViewController: UIViewController, UITextFieldDelegate {
	
	let shared = UserDataStore.sharedDataStore
	
	let createNewUserButton = UIButton()
	let phoneNumberTextField = UITextField()
	let firstNameField = UITextField()
	let lastNameField = UITextField()
	let quoteBookLogo = UIImageView()
	let startQuotes = UIImageView()
	let endQuotes = UIImageView()
	
	let loginWithPhoneNumberTextField = UITextField()
	let loginButton = UIButton()
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		
//		let verifyVC = VerifySMSViewController()
//		presentViewController(verifyVC, animated: true, completion: nil)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		loginWithPhoneNumberTextField.delegate = self
		
		phoneNumberTextField.delegate = self
		
		
		shared.fetchValidPhoneNumbers()
	
		setupScene()
		shared.fetchContacts()
		
	}
	
	func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
		
		
		if (textField == phoneNumberTextField || textField == loginWithPhoneNumberTextField) {
			let newString = (textField.text! as NSString).stringByReplacingCharactersInRange(range, withString: string)
			let components = newString.componentsSeparatedByCharactersInSet(NSCharacterSet.decimalDigitCharacterSet().invertedSet)
			
			let decimalString = components.joinWithSeparator("") as NSString
			let length = decimalString.length
			let hasLeadingOne = length > 0 && decimalString.characterAtIndex(0) == (1 as unichar)
			
			if length == 0 || (length > 10 && !hasLeadingOne) || length > 11
			{
				let newLength = (textField.text! as NSString).length + (string as NSString).length - range.length as Int
				
				return (newLength > 10) ? false : true
			}
			var index = 0 as Int
			let formattedString = NSMutableString()
			
			if hasLeadingOne
			{
				formattedString.appendString("1 ")
				index += 1
			}
			if (length - index) > 3
			{
				let areaCode = decimalString.substringWithRange(NSMakeRange(index, 3))
				formattedString.appendFormat("(%@)", areaCode)
				index += 3
			}
			if length - index > 3
			{
				let prefix = decimalString.substringWithRange(NSMakeRange(index, 3))
				formattedString.appendFormat("%@-", prefix)
				index += 3
			}
			
			let remainder = decimalString.substringFromIndex(index)
			formattedString.appendString(remainder)
			textField.text = formattedString as String
			return false


		}
		return true
	}

	func setupScene() {
		
		view.backgroundColor = UIColor.peterRiverColor()
		let textFieldColor = UIColor.peterRiverColor()
		let borderColor = UIColor.whiteColor().CGColor
		let logoImage = UIImage(named: "quoteBook")
		let cornerRadius = CGFloat(10.0)
		let textColor = UIColor.whiteColor()
		let borderWidth = CGFloat(1.5)
		
		view.addSubview(quoteBookLogo)
		quoteBookLogo.snp_makeConstraints { (make) in
			make.width.equalTo(view.snp_width)
			make.centerY.equalTo(view.snp_centerY).multipliedBy(1.5)
			make.centerX.equalTo(view.snp_centerX)
			make.height.equalTo(view.snp_width).dividedBy(2.575)
		}
		quoteBookLogo.image = logoImage
		
		view.addSubview(startQuotes)
		startQuotes.snp_makeConstraints { (make) in
			make.left.equalTo(view.snp_left).offset(20)
			make.top.equalTo(view.snp_top).offset(20)
			make.width.equalTo(view.snp_width).dividedBy(8)
			make.height.equalTo(view.snp_width).dividedBy(8)
		}
		startQuotes.image = UIImage(named: "startQuotes")
		
		view.addSubview(endQuotes)
		endQuotes.snp_makeConstraints { (make) in
			make.right.equalTo(view.snp_right).offset(-20)
			make.bottom.equalTo(quoteBookLogo.snp_top).offset(-20)
			make.width.equalTo(startQuotes.snp_width)
			make.height.equalTo(startQuotes.snp_height)
		}
		endQuotes.image = UIImage(named: "endQuotes")
		
		view.addSubview(phoneNumberTextField)
		phoneNumberTextField.snp_makeConstraints { (make) in
			make.centerY.equalTo(view.snp_centerY).dividedBy(1.5)
			make.centerX.equalTo(view.snp_centerX)
			make.width.equalTo(view.snp_width).multipliedBy(0.6)
			make.height.equalTo(view.snp_height).dividedBy(18)
		}
		phoneNumberTextField.placeholder = "(###) ###-####"
		phoneNumberTextField.backgroundColor = textFieldColor
		phoneNumberTextField.layer.borderWidth = borderWidth
		phoneNumberTextField.layer.borderColor = borderColor
		phoneNumberTextField.layer.cornerRadius = cornerRadius
		phoneNumberTextField.textColor = textColor
		phoneNumberTextField.keyboardType = .NumberPad
		
		view.addSubview(lastNameField)
		lastNameField.snp_makeConstraints { (make) in
			make.centerX.equalTo(phoneNumberTextField.snp_centerX)
			make.width.equalTo(phoneNumberTextField.snp_width)
			make.height.equalTo(phoneNumberTextField.snp_height)
			make.bottom.equalTo(phoneNumberTextField.snp_top).offset(-10)
		}
		lastNameField.backgroundColor = textFieldColor
		lastNameField.placeholder = " Last Name"
		lastNameField.layer.borderWidth = borderWidth
		lastNameField.layer.borderColor = borderColor
		lastNameField.layer.cornerRadius = cornerRadius
		lastNameField.textColor = textColor
		
		view.addSubview(firstNameField)
		firstNameField.snp_makeConstraints { (make) in
			make.centerX.equalTo(lastNameField.snp_centerX)
			make.width.equalTo(lastNameField.snp_width)
			make.height.equalTo(lastNameField.snp_height)
			make.bottom.equalTo(lastNameField.snp_top).offset(-10)
		}
		firstNameField.backgroundColor = textFieldColor
		firstNameField.placeholder = " First Name"
		firstNameField.layer.borderWidth = borderWidth
		firstNameField.layer.borderColor = borderColor
		firstNameField.layer.cornerRadius = cornerRadius
		firstNameField.textColor = textColor
		
		view.addSubview(createNewUserButton)
		createNewUserButton.snp_makeConstraints { (make) in
			make.top.equalTo(phoneNumberTextField.snp_bottom).offset(20)
			make.width.equalTo(phoneNumberTextField.snp_width)
			make.centerX.equalTo(phoneNumberTextField.snp_centerX)
			make.height.equalTo(view.snp_height).dividedBy(20)
		}
		createNewUserButton.setTitle("Create New User", forState: .Normal)
		createNewUserButton.backgroundColor = UIColor.emeraldColor()
		createNewUserButton.addTarget(self, action: #selector(createNewUserButtonPressed), forControlEvents: .TouchUpInside)
		createNewUserButton.layer.cornerRadius = view.frame.height / 36
	
		view.addSubview(loginWithPhoneNumberTextField)
		loginWithPhoneNumberTextField.snp_makeConstraints { (make) in
			make.width.equalTo(createNewUserButton.snp_width)
			make.center.equalTo(view.snp_center)
			make.height.equalTo(createNewUserButton.snp_height)
		}
		loginWithPhoneNumberTextField.backgroundColor = textFieldColor
		loginWithPhoneNumberTextField.placeholder = "(###) ### #####"
		loginWithPhoneNumberTextField.layer.borderWidth = borderWidth
		loginWithPhoneNumberTextField.layer.borderColor = borderColor
		loginWithPhoneNumberTextField.layer.cornerRadius = cornerRadius
		loginWithPhoneNumberTextField.textColor = textColor
		loginWithPhoneNumberTextField.keyboardType = .NumberPad
		
		view.addSubview(loginButton)
		loginButton.snp_makeConstraints { (make) in
			make.width.equalTo(loginWithPhoneNumberTextField.snp_width)
			make.height.equalTo(loginWithPhoneNumberTextField.snp_height)
			make.centerX.equalTo(loginWithPhoneNumberTextField.snp_centerX)
			make.top.equalTo(loginWithPhoneNumberTextField.snp_bottom).offset(20)
		}
		loginButton.backgroundColor = UIColor.emeraldColor()
		loginButton.setTitle("LOGIN", forState: .Normal)
		loginButton.addTarget(self, action: #selector(loginWithPhoneNumber), forControlEvents: .TouchUpInside)
		loginButton.layer.cornerRadius = view.frame.height / 36
		
	}
	
	func createNewUserButtonPressed() {
		
		createNewUserButton.buttonBounce()
		
		if (phoneNumberTextField.text?.characters.count != 10) {
			
			let alertController = UIAlertController(title: "Oops", message: "please enter a valid phone number", preferredStyle: .Alert)
			let OKAction = UIAlertAction(title: "OK", style: .Default, handler: { (action) in })
			alertController.addAction(OKAction)
			
			presentViewController(alertController, animated: true, completion: nil)
			
		} else if (shared.validPhoneNumbers.contains(phoneNumberTextField.text!)){
			
			let alertController = UIAlertController(title: "Huh?", message: "that phone number already exists", preferredStyle: .Alert)
			let OKAction = UIAlertAction(title: "OK", style: .Default, handler: { (action) in })
			alertController.addAction(OKAction)
			
		} else {
			let userRef = FIRDatabase.database().reference().child("QuoteUser")
			let newUserRef = userRef.child(phoneNumberTextField.text!)
			newUserRef.child("name").setValue(firstNameField.text! + " " + lastNameField.text!)
			
			shared.currentUser = phoneNumberTextField.text
			print("Current User is \(shared.currentUser)")
			
			let verifyVC = VerifySMSViewController()
			presentViewController(verifyVC, animated: true, completion: nil)
		}
		
		//goToPageMenu()
		
	}
	
	func loginWithPhoneNumber() {
		
		print("log In Button Pressed")
		
		loginButton.buttonBounce()
		
		if shared.validPhoneNumbers.contains(loginWithPhoneNumberTextField.text!) {
			shared.currentUser = loginWithPhoneNumberTextField.text
			goToPageMenu()
			
		} else {
			
			let alertController = UIAlertController(title: "Huh?", message: "That user does not exist. Please make a new account", preferredStyle: .Alert)
			let OKAction = UIAlertAction(title: "OK", style: .Default, handler: { (action) in })
			alertController.addAction(OKAction)
			
			presentViewController(alertController, animated: true, completion: nil)
		}
	}
	
	func goToPageMenu() {
		
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let naviVC = storyboard.instantiateViewControllerWithIdentifier("NavigationVC") as! UINavigationController
		let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
		appDelegate.window?.rootViewController = naviVC
	
	}
}
