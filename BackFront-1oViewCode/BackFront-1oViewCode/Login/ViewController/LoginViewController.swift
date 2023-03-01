//
//  LoginViewController.swift
//  BackFront-1oViewCode
//
//  Created by Alessandro Comparini on 01/03/23.
//

import UIKit

class LoginViewController: UIViewController {

    var loginScreen: LoginScreen?
    
    override func loadView() {
        print(#function)
        loginScreen = LoginScreen()
        view = loginScreen
    }
    
    override func viewDidLoad() {
        print(#function)
        super.viewDidLoad()
        configDelegates()
        configTapGesture()
    }

    func configDelegates() {
        loginScreen?.delegate(delegate: self)
        loginScreen?.textFieldsDelegate(delegate: self)
    }
    
    func configTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(lowerKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func lowerKeyboard() {
        print(#function)
        view.endEditing(true)
    }

}


extension LoginViewController: LoginScreenDelegate {
    func tappedOpenChooseButton(_ sender: UIButton) {
        let alert: Alert = Alert(controller: self)
        alert.chooseImage(completion: completionChoose)
    }
    
    func completionChoose(_ option: Choose) {
        print(option)
    }
    
    func tappedLoginButton(_ sender: UIButton) {
        print(#function)
        print(sender)
    }
    
    
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        let email: String = loginScreen?.emailTextField.text ?? ""
        let password: String = loginScreen?.passwordTextField.text ?? ""
        
        if email.isEmpty || password.isEmpty {
            loginScreen?.loginButton.isEnabled = false
            loginScreen?.loginButton.layer.backgroundColor = UIColor.black.withAlphaComponent(0.2).cgColor
            return
        }
        
        loginScreen?.loginButton.isEnabled = true
        loginScreen?.loginButton.layer.backgroundColor = UIColor.black.cgColor
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print(#function)
        return false
    }
    
}
