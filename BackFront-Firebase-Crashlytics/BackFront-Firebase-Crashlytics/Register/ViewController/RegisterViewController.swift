//
//  RegisterViewController.swift
//  BackFront-Firebase-Crashlytics
//
//  Created by Alessandro Comparini on 07/03/23.
//

import UIKit

class RegisterViewController: UIViewController {

    private let registerScreen: RegisterScreen = RegisterScreen()

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = registerScreen
        navigationController?.navigationBar.tintColor = UIColor.black.withAlphaComponent(0.8)
    }

}
