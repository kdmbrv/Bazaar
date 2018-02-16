//
//  UserViewController.swift
//  Bazaar
//
//  Created by Kostya Dombrovski on 7/13/17.
//  Copyright © 2017 Kostya Dombrovski. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

	@IBOutlet weak var usernameTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var loginButton: UIButton!
	@IBOutlet var errorMessage: UILabel!
	
	var logins: [String: String] = ["admin": "password"]
	var users: [String: String] = ["admin": "Admin"]
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		let defaults = UserDefaults.standard
		
		let savedData = defaults.bool(forKey: "isLoggedIn")
		if (savedData) {
			self.performSegue(withIdentifier: "logInSuccessful", sender: self)
		}

		// Stylings
		usernameTextField.layer.cornerRadius = 8
		usernameTextField.layer.borderColor = UIColor.gray.cgColor
		usernameTextField.layer.borderWidth = 2
		passwordTextField.layer.cornerRadius = 8
		passwordTextField.layer.borderColor = UIColor.gray.cgColor
		passwordTextField.layer.borderWidth = 2
        loginButton.layer.cornerRadius = 4
		
		// Delegates
		usernameTextField.delegate = self
		passwordTextField.delegate = self
		
		// Error message
		self.errorMessage.text = ""
		self.errorMessage.textColor = UIColor.red
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	//MARK: UITextFieldDelegates
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		if (textField == usernameTextField) {
			// Switch to password field
			passwordTextField.becomeFirstResponder()
		}
		else if (textField == passwordTextField) {
			// Run login function
			loginButtonPressed(self)
		}
		
		return true
	}

    //MARK: Actions
	@IBAction func loginButtonPressed(_ sender: Any?) {
		let username = usernameTextField.text
		let password = passwordTextField.text
		if (logins[username!] != nil) {
			if (logins[username!]! == password!) {
				let userDefault = UserDefaults.standard
				userDefault.set(true, forKey: "isLoggedIn")
				userDefault.set(users[username!], forKey: "userName")
				userDefault.synchronize()
				self.performSegue(withIdentifier: "logInSuccessful", sender: self)
			}
			else {
				self.errorMessage.text = "Incorrect password!"
			}
		}
		else {
			self.errorMessage.text = "Username not recognized!"
		}
	}

}
