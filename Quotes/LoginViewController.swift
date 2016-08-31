//
//  LoginViewController.swift
//  Quotes
//
//  Created by David Park on 8/30/16.
//  Copyright © 2016 DavidVY. All rights reserved.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
	
	let loginButton = UIButton()
	let phoneNumberTextField = UITextField()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
	
		setupScene()
	}


	func setupScene() {
		view.addSubview(phoneNumberTextField)
		phoneNumberTextField.snp_makeConstraints { (make) in
			make.center.equalTo(view.snp_center)
			make.width.equalTo(view.snp_width).multipliedBy(0.75)
		}
		phoneNumberTextField.placeholder = "(###) ###-####"
		
		view.addSubview(loginButton)
		loginButton.snp_makeConstraints { (make) in
			make.top.equalTo(phoneNumberTextField.snp_bottom).offset(20)
			make.width.equalTo(phoneNumberTextField.snp_width).dividedBy(2)
			make.centerX.equalTo(phoneNumberTextField.snp_centerX)
		}
		loginButton.setTitle("LOGIN", forState: .Normal)
		loginButton.backgroundColor = UIColor.peterRiverColor()
	}
}
