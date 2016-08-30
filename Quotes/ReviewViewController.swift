//
//  ReviewViewController.swift
//  Quotes
//
//  Created by David Park on 8/29/16.
//  Copyright © 2016 DavidVY. All rights reserved.
//

import UIKit
import SnapKit

class ReviewViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done🖋", style: UIBarButtonItemStyle.Done, target: self, action: #selector(doneButtonPressed))
		
		view.backgroundColor = UIColor.blueColor()
	}
	
	func doneButtonPressed() {
		
		let alertController = UIAlertController(title: "Create Quote?", message: "Would you like to publish a new quote?", preferredStyle: .Alert)
		
		let OKAction = UIAlertAction(title: "Quote It", style: .Default) { (action) in
			self.navigationController?.popViewControllerAnimated(true)
		}
		
		let cancelAction = UIAlertAction(title: "Cancel", style: .Default) { (action) in }
		
		alertController.addAction(cancelAction)
		alertController.addAction(OKAction)
		
		presentViewController(alertController, animated: true, completion: nil)
	}

}
