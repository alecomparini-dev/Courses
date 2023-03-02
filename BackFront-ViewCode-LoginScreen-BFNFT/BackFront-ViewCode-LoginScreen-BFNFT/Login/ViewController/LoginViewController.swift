//
//  LoginViewController.swift
//  BackFront-ViewCode-LoginScreen-BFNFT
//
//  Created by Alessandro Comparini on 02/03/23.
//

import UIKit

class LoginViewController: UIViewController {

    var loginScreen: LoginScreen?
    
    override func loadView() {
        super.loadView()
        loginScreen = LoginScreen()
        self.view = loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
