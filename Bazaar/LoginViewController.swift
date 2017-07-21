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
	
    override func viewDidLoad() {
        super.viewDidLoad()

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
		}
		
		return true
	}

    //MARK: Actions
	@IBAction func loginUser(_ sender: UIButton) {
	}

}
