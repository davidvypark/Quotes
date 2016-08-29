//
//  ProfileViewController.swift
//  Quotes
//
//  Created by David Park on 8/28/16.
//  Copyright © 2016 DavidVY. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
	
	var parentNavigationController: UINavigationController?
	
	private let headerIdentifier = "header"
	
	var collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: UICollectionViewFlowLayout())
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = UIColor.blueColor()
		setupCollectionView()
	}
	
	func setupCollectionView() {
		
		let layout = UICollectionViewFlowLayout()
		layout.minimumLineSpacing = 1
		layout.minimumInteritemSpacing = 1
		layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height/3)
		
	}
	
}
