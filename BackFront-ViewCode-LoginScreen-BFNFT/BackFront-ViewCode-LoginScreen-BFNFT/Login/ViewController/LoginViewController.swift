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
        configTextFieldsDelegate()
        configTapGesture()
    }
    
    
    private func configTextFieldsDelegate() {
        loginScreen?.loginTextField.delegate = self
        loginScreen?.passwordTextField.delegate = self
    }
    
    private func configTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(lowerKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func lowerKeyboard() {
        view.endEditing(true)
    }
    
}


//MARK: - extension delegate text fields

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print(#function)
        return false
    }
    
    
}
