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
	
	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		
		let tabBarHeight = self.view.frame.height * 0.092
		var tabFrame = self.tabBar.frame
		tabFrame.size.height = tabBarHeight
		tabFrame.origin.y = self.view.frame.size.height - tabBarHeight
		self.tabBar.frame = tabFrame
		
	}
	
	func setupTabs() {
		
		self.tabBar.translucent = true
		self.tabBar.backgroundColor = UIColor.clearColor()
		self.tabBar.tintColor = UIColor.quotesRed()
		
		let homeVC = HomeViewController()
		homeVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "feedIcon")?.imageWithRenderingMode(.AlwaysOriginal) , tag: 0)
		homeVC.tabBarItem.imageInsets = UIEdgeInsets(top: 3, left: -4, bottom: -10, right: -4)
		
		let homeNav = UINavigationController(rootViewController: homeVC)
		homeNav.navigationBar.frame = CGRectMake(0, 0, view.frame.width, view.frame.height * 0.5)
		homeNav.navigationBar.barTintColor = UIColor.whiteColor()
		homeNav.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.quotesRed(), NSFontAttributeName: UIFont(name: Constants.headerFont, size: 22)!]
		homeNav.navigationBar.topItem?.title = "QUOTES"
		
		let addQuoteVC = AddQuoteViewController()
		addQuoteVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "quoteProcessIcon")?.imageWithRenderingMode(.AlwaysOriginal), tag: 1)
		addQuoteVC.tabBarItem.imageInsets = UIEdgeInsets(top: 3, left: -4, bottom: -10, right: -4)
		
		let profileVC = ProfileViewController()
		profileVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "ProfileIcon")?.imageWithRenderingMode(.AlwaysOriginal), tag: 2)
		profileVC.tabBarItem.image?.imageWithRenderingMode(.AlwaysOriginal)
		profileVC.tabBarItem.imageInsets = UIEdgeInsets(top: 3, left: -4, bottom: -10, right: -4)
		
		let controllers = [homeNav, addQuoteVC, profileVC]
		self.viewControllers = controllers
		self.selectedIndex = 0
		
		
		
		
	}

}

class TabBar: UITabBar {
	
	override func sizeThatFits(size:CGSize) -> CGSize {
		var sizeThatFits = super.sizeThatFits(size)
		sizeThatFits.height = 100
		
		return sizeThatFits
	}
}
