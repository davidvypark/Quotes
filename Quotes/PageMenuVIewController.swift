//
//  ViewController.swift
//  Quotes
//
//  Created by David Park on 8/27/16.
//  Copyright © 2016 DavidVY. All rights reserved.
//

import UIKit
import PageMenu

class PageMenuViewController: UIViewController {
	
	var pageMenu: CAPSPageMenu?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = UIColor.quotesBackgroundColor()
		
		setupNavBar()
		setupPages()
	}
	
	func setupNavBar() {
		let image = UIImage(named: "quoteBook")
		let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
		imageView.contentMode = .ScaleAspectFit
		imageView.image = image
		self.navigationItem.titleView = imageView
		
		self.navigationController?.navigationBar.barTintColor = UIColor.peterRiverColor()
		self.navigationController?.navigationBar.shadowImage = UIImage()
		self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
		self.navigationController?.navigationBar.translucent = false
		self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
		self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont(name: Constants.headerFont, size: 25)!]
	}
	
	func setupPages() {
		
		var controllerArray: [UIViewController] = []
		
		let homeVC = HomeViewController()
		homeVC.title = "HOME"
		homeVC.parentNavigationController = self.navigationController
		
		let addQuoteVC = AddQuoteViewController()
		addQuoteVC.title = "ADD QUOTE"
		addQuoteVC.parentNavigationController = self.navigationController
		
		let profileVC = ProfileViewController()
		profileVC.title = "PROFILE"
		profileVC.parentNavigationController = self.navigationController
		
		controllerArray.append(homeVC)
		controllerArray.append(addQuoteVC)
		controllerArray.append(profileVC)
		
		let parameters: [CAPSPageMenuOption] = [
			.ScrollMenuBackgroundColor(UIColor.quotesBackgroundColor()),
			.ViewBackgroundColor(UIColor.quotesBackgroundColor()),
			.SelectionIndicatorColor(UIColor.peterRiverColor()),
			.BottomMenuHairlineColor(UIColor(red: 70.0/255.0, green: 70.0/255.0, blue: 80.0/255.0, alpha: 1.0)),
			.MenuItemFont(UIFont(name: Constants.headerFont, size: 13.0)!),
			.MenuHeight(40.0),
			.MenuItemWidth(100.0),
			.CenterMenuItems(true),
			.SelectedMenuItemLabelColor(UIColor.peterRiverColor())
			]
		
		pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height), pageMenuOptions: parameters)
		
		self.view.addSubview(pageMenu!.view)

	}


}

