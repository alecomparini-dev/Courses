//
//  LoginVC.swift
//  BackFront-BFNFT
//
//  Created by Alessandro Comparini on 10/03/23.
//

import UIKit
import Firebase

class LoginVC: UIViewController {

    private var loginScreen: LoginScreen?
   
    override func loadView() {
        super.loadView()
        loginScreen = LoginScreen()
        view = self.loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configAccessibilitys()
        configDelegates()
        hideKeyboard()
    }
    
    
//  MARK: - ACCESSIBILITYS
    
    private func configAccessibilitys() {
        configAccessibilityOrder()
    }
    
    private func configAccessibilityOrder() {
        guard let two = loginScreen?.logoImageView,
              let three = loginScreen?.logoLabel,
              let four = loginScreen?.descriptionLabel,
              let five = loginScreen?.emailTextField,
              let six = loginScreen?.passworldTextField,
              let seven = loginScreen?.forgotButton,
              let eight = loginScreen?.loginView,
              let nine = loginScreen?.loginButton,
              let teen = loginScreen?.lineView,
              let eleven = loginScreen?.signInMetaMaskView else { return }
        
        view.accessibilityElements = [two, three, four,five, six, seven, eight, nine, teen, eleven]
        
    }
    
    private func configDelegates() {
        loginScreen?.configTextFieldsDelegate(delegate: self)
        loginScreen?.configLoginScreenDelegate(delegate: self)
    }
    
}

//  MARK: - EXTENSION DELEGATES
extension LoginVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
}

extension LoginVC: LoginScreenDelegate {
    
    func tappedForgotButton() {
        print(#function)
    }
    
    func tappedLoginButton() {
        print(#function)
    }
    
    func tappedSignInMetaMask() {
        print(#function)
    }
    
    func tappedSignUpButton() {
        print(#function)
    }
    
}
