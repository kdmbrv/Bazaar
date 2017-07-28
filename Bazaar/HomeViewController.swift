//
//  HomeViewController.swift
//  Bazaar
//
//  Created by Kostya Dombrovski on 7/13/17.
//  Copyright © 2017 Kostya Dombrovski. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

	//MARK: Properties
	@IBOutlet weak var loginNavigator: UIBarButtonItem!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		// Set to logout if already logged in
		let userDefault = UserDefaults.standard
		
		let savedData = userDefault.bool(forKey: "isLoggedIn")
		if (savedData) {
			loginNavigator.title = "Log Out"
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func loginNavigationPress(_ sender: Any) {
		if (loginNavigator.title == "Log Out") {
			let userDefault = UserDefaults.standard
			userDefault.set(false, forKey: "isLoggedIn")
			userDefault.synchronize()
			viewWillAppear(true)
		}
		else {
			self.performSegue(withIdentifier: "goToLogin", sender: self)
		}
	}

}

