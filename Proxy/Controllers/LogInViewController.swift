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
    
    override func viewWillAppear(_ animated: Bool) {
        resetValues()
    }

    func initialSetup() {
        loginButton.layer.cornerRadius = 22.5
        registerButton.addTarget(self, action: #selector(LogInViewController.registerUser), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(LogInViewController.loginWithUser), for: .touchUpInside)
        self.hideKeyboardWhenTappedAround()
    }
    
    func resetValues() {
        emailTextField.text = ""
        passwordTextField.text = ""
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @objc func loginWithUser() {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        Auth.auth().signIn(withEmail: email, password: password) { (response, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            if let user = response?.user {
                print("User \(user) logged in!")
                self.setupTabBar()
            }
        }
    }
    
    @objc func registerUser() {
        let registerViewController = RegisterViewController()
        self.navigationController?.pushViewController(registerViewController, animated: true)
    }
    
    func setupTabBar() {
        let searchViewController = SearchViewController()
        searchViewController.tabBarItem = UITabBarItem(title: "Dashboard", image: UIImage(named: "shop"), tag: 1)
        let profileViewController = ProfileViewController()
        profileViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "user_male"), tag: 2)
        let addListingViewController = AddListingViewController()
        addListingViewController.tabBarItem = UITabBarItem(title: "Post", image: UIImage(named: "plus"), tag: 3)
        let chatsViewController = ChatsViewController()
        chatsViewController.tabBarItem = UITabBarItem(title: "Chat", image: UIImage(named: "speech_buble"), tag: 4)
        let tabBarViewController = UITabBarController()
        tabBarViewController.setViewControllers([searchViewController, addListingViewController, chatsViewController, profileViewController], animated: true)
        tabBarViewController.tabBar.tintColor = UIColor(named: "babyRed")
        tabBarViewController.tabBar.backgroundColor = .white
        navigationController?.navigationBar.tintColor = UIColor(named: "trafficLightGreen")
        navigationController?.navigationBar.barStyle = .blackTranslucent
        self.navigationController?.pushViewController(tabBarViewController, animated: true)
    }

}
