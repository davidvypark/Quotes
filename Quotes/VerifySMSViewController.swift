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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = UIColor.whiteColor()
		setupScene()
	}
	
	func setupScene() {
		
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
		verifyButton.backgroundColor = UIColor.amethystColor()
		
		view.addSubview(codeTextField)
		codeTextField.snp_makeConstraints { (make) in
			make.width.equalTo(verifyButton.snp_width)
			make.height.equalTo(verifyButton.snp_height)
			make.centerX.equalTo(verifyButton.snp_centerX)
			make.bottom.equalTo(verifyButton.snp_top).offset(-10)
		}
		codeTextField.backgroundColor = UIColor.belizeHoleColor()
		
		
	}

}
