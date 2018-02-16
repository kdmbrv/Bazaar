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
	@IBOutlet weak var welcomeLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		welcomeLabel.text = ""
		// Do any additional setup after loading the view, typically from a nib.
		
		// Set to logout if already logged in
		let userDefault = UserDefaults.standard
		
		let savedData = userDefault.bool(forKey: "isLoggedIn")
		if (savedData) {
			loginNavigator.title = "Log Out"
			let userName = userDefault.string(forKey: "userName") ?? "user"
			welcomeLabel.text = "Welcome, " + userName + "!"
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
			loginNavigator.title = "Log In"
			viewWillAppear(true)
			viewDidLoad()
		}
		else {
			self.performSegue(withIdentifier: "goToLogin", sender: self)
		}
	}

}

