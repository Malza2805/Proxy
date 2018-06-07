//
//  LogInViewController.swift
//  Proxy
//
//  Created by Josipa Lipovac on 07/06/2018.
//  Copyright © 2018 ruaziosteam. All rights reserved.
//

import UIKit
import FirebaseAuth

class LogInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }

    func initialSetup() {
        loginButton.layer.cornerRadius = 22.5
    }
    
    @objc func loginWithUser() {
        guard let email = emailTextField.text, let password = emailTextField.text else { return }
        Auth.auth().signIn(withEmail: email, password: password) { (response, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            if let user = response?.user {
                let changeRequest = user.createProfileChangeRequest()
                changeRequest.displayName = "Test"
                print("User \(user) logged in!")
            }
        }
    }

    

}
