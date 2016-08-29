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
	
	var textBox = UITextView()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = UIColor.cyanColor()
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
		textBox.backgroundColor = UIColor.alizarinColor()
		textBox.font = UIFont(name: "ArialMT", size: 20)
		textBox.textColor = UIColor.whiteColor()
	}
}
