//
//  LoginViewController.swift
//  BackFront-Firebase-Crashlytics
//
//  Created by Alessandro Comparini on 07/03/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let loginScreen: LoginScreen = LoginScreen()
    private let viewModel: LoginViewModel = LoginViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = loginScreen
        configScreen()
    }
    
    
    private func configScreen() {
        configTapGesture()
        loginScreen.loginScreenDelegate(delegate: self)
        loginScreen.textFieldsDelegate(delegate: self)
    }
    
    private func configTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(lowerKeyboard))
        view.addGestureRecognizer(tap)
    }

    @objc func lowerKeyboard() {
        view.endEditing(true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
}

extension LoginViewController: LoginScreenDelegate {
    func tappedSignUpButton() {
        lowerKeyboard()
        let registerVC = RegisterViewController()
        navigationController?.pushViewController(registerVC, animated: true)
    }
    
    func tappedContinueButton() {
        viewModel.login(email: loginScreen.emailTextField.text ?? "", password: loginScreen.passwordTextField.text ?? "", completion: returnLogin)
        lowerKeyboard()
    }
    
    func returnLogin(error: String?) {
        if error != nil {
            let alert = Alert(controller: self, title: "Warning", message: "User or Password incorrect")
            alert.warning()
            return
        }
        let homeScreenVC = HomeViewController()
        navigationController?.pushViewController(homeScreenVC, animated: true)
    }
    
    
}
