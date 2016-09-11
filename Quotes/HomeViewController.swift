//
//  HomeViewController.swift
//  Quotes
//
//  Created by David Park on 8/28/16.
//  Copyright © 2016 DavidVY. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class HomeViewController: UITableViewController {
	
	var parentNavigationController: UINavigationController?
	var searchController = UISearchController(searchResultsController: nil)
	var customSearchController: CustomSearchController!
	
	var isSearching = false
	
	var shared = UserDataStore.sharedDataStore
	var filteredPosts = [QuoteQuote]()
	var searchFilteredPosts = [QuoteQuote]()
	
	var testUser1: QuoteUser!				// Test
	var testUser2: QuoteUser!				// Data
	var testQuote1: QuoteQuote!				// To
	var testQuote2: QuoteQuote!				// Delete
	
	let rootRef = FIRDatabase.database().reference()
	let quoteRef = FIRDatabase.database().reference().child("QuoteQuote")

	override func viewDidLoad() {
		super.viewDidLoad()
		setupNavBar()
		setupSearch()
		
		//setupCustomSearchController()
		//tableView.tableHeaderView = searchController.searchBar
	
		view.backgroundColor = UIColor.whiteColor()
		tableView.registerClass(QuoteTableViewCell.self, forCellReuseIdentifier: QuoteTableViewCell.cellIdentifier)
		tableView.separatorStyle = .SingleLine
		tableView.allowsSelection = false
		tableView.rowHeight = UITableViewAutomaticDimension
		tableView.estimatedRowHeight = view.frame.height / 4
		
		
		addContactsToUserDataDict()
		fetchPostsData { 
			self.filterPosts()
		}

	}
	
	
	func setupNavBar() {
		
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "SearchIcon")?.imageWithRenderingMode(.AlwaysOriginal) , style: .Done, target: self, action: #selector(searchButtonPressed))
		
	}
	
	func fetchPostsData(completion: ()-> ()) {
		print("fetching posts from database")
		
		self.shared.posts.removeAll()
		quoteRef.observeEventType(.ChildAdded, withBlock: { snapshot in
			print(snapshot)
			if let dict = snapshot.value as? [String: AnyObject] {
				let authorId = dict["authorId"] as! String
				let author = dict["author"] as! String
				let content = dict["content"] as! String
				let date = dict["date"] as! String
				let heardBy = dict["heardBy"] as! NSArray
					
				print (heardBy)
				print ("after")
				
				self.shared.posts.insert((QuoteQuote(authorId: authorId, author: author, heardBy: heardBy as? [String], content: content, date: date)), atIndex: 0)
				self.tableView.reloadData()
			}
			completion()
		})
	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		if isSearching {
			return searchFilteredPosts.count
		} else {
			return filteredPosts.count
		}
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCellWithIdentifier(QuoteTableViewCell.cellIdentifier, forIndexPath: indexPath) as! QuoteTableViewCell
		
		var post: QuoteQuote
		
		if isSearching {
			post = searchFilteredPosts[indexPath.row]
		} else {
			post = filteredPosts[indexPath.row]
		}
		
		
		var heardByString = ""
		
		cell.preservesSuperviewLayoutMargins = false
		cell.separatorInset = UIEdgeInsetsZero
		cell.layoutMargins = UIEdgeInsetsZero
		
		print(post)
		
		let picture = shared.userDataDict[post.authorId]!["picture"] as! String
		cell.profilePic.setImage(UIImage(named:picture)?.circle, forState: .Normal)
		cell.usernameLabel.text = post.author
		cell.quoteBoxLabel.text = post.content
		cell.quoteBoxLabel.addImage("rightQuotations")
		cell.dateLabel.text = post.date
		
		for id in post.heardBy {
			
			heardByString.appendContentsOf(shared.userDataDict[id]?["name"] as! String)
			heardByString.appendContentsOf(", ")
		}
		print (post.heardBy)
		let heardBy = heardByString.substringToIndex(heardByString.endIndex.advancedBy(-2)).boldedAttributedString
		
		//configure heard by attributed string
		
		let prefix = NSMutableAttributedString(string: "Heard by: ")
		let prefixAttributes = [NSForegroundColorAttributeName: UIColor.quotesGrey(),
		                        NSFontAttributeName: UIFont.boldSystemFontOfSize(UIFont.systemFontSize())]
		
		prefix.addAttributes(prefixAttributes, range: NSMakeRange(0, prefix.length))

		prefix.appendAttributedString(heardBy)
		
		//**********
		
		cell.heardPersonLabel.attributedText = prefix
		
		cell.layoutIfNeeded()

		return cell
	}
	
	func filterPosts() {
		filteredPosts.removeAll()
		for post in shared.posts {
			if post.authorId == shared.currentUser || post.heardBy.contains(shared.currentUser) || shared.userContacts.values.contains(post.authorId) {
				filteredPosts.append(post)
			}
		}
		print ("filtered \(filteredPosts)")
	}
	
	func addContactsToUserDataDict() {
		for contactName in shared.userContacts.keys {
			var subDict = [String: String]()
			subDict["name"] = contactName
			subDict["picture"] = "defaultPicture"
			shared.userDataDict[shared.userContacts[contactName]!] = subDict
		}
	}
	
	// MARK: Search Functionality

	func searchButtonPressed() {
		print("search button pressed")
		
		//tableView.tableHeaderView = customSearchController.customSearchBar
		//customSearchController.customSearchBar.becomeFirstResponder()
		
		tableView.tableHeaderView = searchController.searchBar
		searchController.searchBar.becomeFirstResponder()
		
		tableView.separatorStyle = .None
		
		
	}
	
	func setupSearch() {
		searchController.searchResultsUpdater = self
		searchController.searchBar.delegate = self
		searchController.dimsBackgroundDuringPresentation = false
		definesPresentationContext = true
		searchController.searchBar.placeholder = "Search who said it or who heard it"
		searchController.searchBar.sizeToFit()
		
		searchController.searchBar.searchBarStyle = .Prominent
		searchController.searchBar.backgroundColor = UIColor.whiteColor()
		searchController.searchBar.setImage(UIImage(named: "xIcon"), forSearchBarIcon: .Clear, state: .Normal)
		searchController.searchBar.setImage(UIImage(named: "xIcon"), forSearchBarIcon: .Clear, state: .Highlighted)
		
		let searchIcon = UIImageView(image: UIImage(named: "SearchIcon"))
		UITextField.appearanceWhenContainedInInstancesOfClasses([UISearchBar.self]).leftView = nil
		//UITextField.appearanceWhenContainedInInstancesOfClasses([UISearchBar.self]).backgroundColor = UIColor.whiteColor()
		UISearchBar.appearance().searchTextPositionAdjustment = UIOffsetMake(40, 0)
		searchIcon.frame = CGRectMake(10, 10, 25, 25)
		searchController.searchBar.addSubview(searchIcon)
		//searchController.searchBar.setImage(UIImage(named: "SearchIcon"), forSearchBarIcon: .Search, state: .Normal)
		searchController.searchBar.tintColor = UIColor.quotesRed()
		searchController.searchBar.barTintColor = UIColor.whiteColor()
		
		UIBarButtonItem.appearanceWhenContainedInInstancesOfClasses([UISearchBar.self]).setTitleTextAttributes([NSFontAttributeName: UIFont(name: Constants.headerFont, size: 17)!], forState: .Normal)
	}
	
	func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
		isSearching = true

		tableView.reloadData()
	}
	
	func searchBarCancelButtonClicked(searchBar: UISearchBar) {
		isSearching = false

		tableView.tableHeaderView = nil
		tableView.separatorStyle = .SingleLine
		tableView.reloadData()
	}
	
	func searchBarSearchButtonClicked(searchBar: UISearchBar) {
		if !isSearching {
			isSearching = true
			tableView.reloadData()
		}
		searchController.searchBar.resignFirstResponder()
	}
	
	//this function should be used for the heardBy label as well
	func stringVersion(numArray: [String]) -> String {
		var stringVersion = ""
		
		for number in numArray {
			
			let user = shared.userDataDict[number] as! [String: String]
			stringVersion.appendContentsOf(user["name"]!)
			
		}
		return stringVersion
	}
	
	// MARK: Tried to make a custom searchController and SearchBar but decided that was unncecessary
	
//	func setupCustomSearchController() {
//		customSearchController = CustomSearchController(searchResultsController: self, searchBarFrame: CGRectMake(0.0, 0.0, tableView.frame.size.width, 60.0), searchBarFont: UIFont(name: Constants.basicFont, size:16)!, searchBarTextColor: UIColor.quotesRed(), searchBarTintColor: UIColor.whiteColor())
//
//		customSearchController.customSearchBar.placeholder = "Search who said it or who heard it"
//		customSearchController.dimsBackgroundDuringPresentation = false
//		customSearchController.customDelegate = self
//	}
	
//	func didStartSearching() {
//		isSearching = true
//		tableView.reloadData()
//	}
//	
//	func didTapOnSearchButton() {
//		if !isSearching {
//			isSearching = true
//			tableView.reloadData()
//		}
//	}
//	
//	func didTapOnCancelButton() {
//		isSearching = false
//		
//		tableView.tableHeaderView = nil
//		tableView.separatorStyle = .SingleLine
//		tableView.reloadData()
//	}
//	
//	func didChangeSearchText(searchText: String) {
//		let searchString = searchText
//
//		let saidByFilter = filteredPosts.filter { $0.author.containsString(searchString) }
//		let hearByFilter = filteredPosts.filter { stringVersion($0.heardBy).containsString(searchString) }
//		
//		searchFilteredPosts = saidByFilter + hearByFilter
//
//		tableView.reloadData()
//	}
	
	
}

extension HomeViewController: UISearchBarDelegate {
	
	func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
		
	}
}

extension HomeViewController: UISearchResultsUpdating {
	
	func updateSearchResultsForSearchController(searchController: UISearchController) {
		let searchString = searchController.searchBar.text
		
		if searchString != nil {
			let saidByFilter = filteredPosts.filter { $0.author.containsString(searchString!) }
			let hearByFilter = filteredPosts.filter { stringVersion($0.heardBy).containsString(searchString!) }
			
			searchFilteredPosts = saidByFilter + hearByFilter
		}
		tableView.reloadData()
	}
}


extension HomeViewController: QuoteTableViewCellDelegate {
	
	func profilePictureTapped() {
		let userProfileVC = ProfileViewController()
		presentViewController(userProfileVC, animated: true, completion: nil)
	}
}
