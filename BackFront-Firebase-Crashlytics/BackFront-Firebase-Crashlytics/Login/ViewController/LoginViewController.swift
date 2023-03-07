//
//  LoginViewController.swift
//  BackFront-Firebase-Crashlytics
//
//  Created by Alessandro Comparini on 07/03/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let loginScreen: LoginScreen = LoginScreen()
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = loginScreen
    }
    

}
