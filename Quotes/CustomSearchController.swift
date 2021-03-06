//
//  CustomSearchController.swift
//  Quotes
//
//  Created by David Park on 9/11/16.
//  Copyright © 2016 DavidVY. All rights reserved.
//

import UIKit

protocol CustomSearchControllerDelegate {
	func didStartSearching()
	
	func didTapOnSearchButton()
	
	func didTapOnCancelButton()
	
	func didChangeSearchText(searchText: String)
}


class CustomSearchController: UISearchController, UISearchBarDelegate {
	
	var customSearchBar: CustomSearchBar!
	var customDelegate: CustomSearchControllerDelegate!
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

	init(searchResultsController: UIViewController!, searchBarFrame: CGRect, searchBarFont: UIFont, searchBarTextColor: UIColor, searchBarTintColor: UIColor) {
		super.init(searchResultsController: searchResultsController)
		
		configureSearchBar(searchBarFrame, font: searchBarFont, textColor: searchBarTextColor, bgColor: searchBarTintColor)
	}
	
	
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	
	// MARK: Custom functions
	
	func configureSearchBar(frame: CGRect, font: UIFont, textColor: UIColor, bgColor: UIColor) {
		customSearchBar = CustomSearchBar(frame: frame, font: font , textColor: textColor)
		
		customSearchBar.barTintColor = bgColor
		customSearchBar.tintColor = textColor
		customSearchBar.showsBookmarkButton = false
		customSearchBar.showsCancelButton = true
		
		customSearchBar.setImage(UIImage(named: "xIcon"), forSearchBarIcon: .Clear, state: .Normal)
		customSearchBar.setImage(UIImage(named: "xIcon"), forSearchBarIcon: .Clear, state: .Highlighted)
		
		customSearchBar.setImage(UIImage(named: "SearchIcon"), forSearchBarIcon: .Search, state: .Normal)
		
		customSearchBar.delegate = self
	}
	
	
	// MARK: UISearchBarDelegate functions
	
	func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
		customDelegate.didStartSearching()
	}
	
	
	func searchBarSearchButtonClicked(searchBar: UISearchBar) {
		customSearchBar.resignFirstResponder()
		customDelegate.didTapOnSearchButton()
	}
	
	
	func searchBarCancelButtonClicked(searchBar: UISearchBar) {
		customSearchBar.resignFirstResponder()
		customDelegate.didTapOnCancelButton()
	}
	
	
	func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
		customDelegate.didChangeSearchText(searchText)
	}
	
}

