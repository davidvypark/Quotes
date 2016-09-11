//
//  TabBarController.swift
//  Quotes
//
//  Created by David Park on 9/10/16.
//  Copyright © 2016 DavidVY. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = UIColor.whiteColor()
		
		setupTabs()
	}
	
	func setupTabs() {
		
		self.tabBar.translucent = true
		self.tabBar.backgroundColor = UIColor.clearColor()
		self.tabBar.tintColor = UIColor.quotesRed()
		//self.tabBar.barTintColor = UIColor.quotesTabBar()
		
		
		
		let tabBarHeight = self.view.frame.height * 0.092
		var tabFrame = self.tabBar.frame
		tabFrame.size.height = tabBarHeight
		tabFrame.origin.y = self.view.frame.size.height - tabBarHeight
		self.tabBar.frame = tabFrame
		
		let homeVC = HomeViewController()
		homeVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "feedIcon")?.imageWithRenderingMode(.AlwaysOriginal), tag: 0)
		homeVC.tabBarItem.image?.imageWithRenderingMode(.Automatic)
		homeVC.tabBarItem.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: -10, right: 0)
		homeVC.tabBarItem.selectedImage?.imageWithRenderingMode(.AlwaysOriginal)
		
		let addQuoteVC = AddQuoteViewController()
		addQuoteVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "quoteProcessIcon")?.imageWithRenderingMode(.AlwaysOriginal), tag: 1)
		addQuoteVC.tabBarItem.image?.imageWithRenderingMode(.AlwaysTemplate)
		addQuoteVC.tabBarItem.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: -10, right: 0)
		addQuoteVC.tabBarItem.selectedImage?.imageWithRenderingMode(.AlwaysOriginal)
		
		let profileVC = ProfileViewController()
		profileVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "ProfileIcon")?.imageWithRenderingMode(.AlwaysOriginal), tag: 2)
		profileVC.tabBarItem.image?.imageWithRenderingMode(.AlwaysOriginal)
		profileVC.tabBarItem.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: -10, right: 0)
		profileVC.tabBarItem.selectedImage?.imageWithRenderingMode(.AlwaysOriginal)
		
		let controllers = [homeVC, addQuoteVC, profileVC]
		self.viewControllers = controllers
		self.selectedIndex = 0
		
		
		
		
	}

}
