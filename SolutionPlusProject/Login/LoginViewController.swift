//
//  LoginViewController.swift
//  SolutionPlusProject
//
//  Created by Apple on 07/05/2024.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextfield: FloatingLabelTextField!
    @IBOutlet weak var passwordTextField: FloatingLabelTextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
    }

    private func setupUI() {
        // Customize text fields
        usernameTextfield.labelText = "Username"
        usernameTextfield.placeholder = "Enter your username"
        usernameTextfield.icon = UIImage(named: "username_icon")
        
        passwordTextField.labelText = "Password"
        passwordTextField.placeholder = "Enter your password"
        passwordTextField.icon = UIImage(named: "password_icon")
        
        // Customize login button
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .blue
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 8
    }

    private func setupActions() {
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }

    @objc func loginButtonTapped() {
        guard let username = usernameTextfield.text, !username.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            // Handle invalid input
            return
        }
        // Perform login logic here
        print("Username: \(username), Password: \(password)")
    }
}

