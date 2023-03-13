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
    private let viewModel = LoginViewModel()
   
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
        enabledLoginButton(false)
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
              let six = loginScreen?.passwordTextField,
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
        validateInputData(textField)
        validateLoginButton()
        print(#function)
    }
    
    private func validateInputData(_ textField: UITextField) {
        switch textField {
        case loginScreen?.emailTextField:
            if !(viewModel.validateEmail(loginScreen?.emailTextField.text ?? "")) { wrongFieldStyle(textField) }
            else { correctFieldStyle(textField) }
            break
            
        case loginScreen?.passwordTextField:
            if !(viewModel.validatePassword(loginScreen?.passwordTextField.text ?? "" )) { wrongFieldStyle(textField) }
            else { correctFieldStyle(textField) }
            break
            
        default:
            break
        }
    }
    
    private func validateLoginButton() {
        if viewModel.validateEmail(loginScreen?.emailTextField.text ?? "") &&
            viewModel.validatePassword(loginScreen?.passwordTextField.text ?? "") {
            enabledLoginButton(true)
        } else {
            enabledLoginButton(false)
        }
    }
    
    private func enabledLoginButton(_ isEnabled: Bool) {
        if !isEnabled {
            disabledLoginButtonStyle()
            return
        }
        enabledLoginButtonStyle()
    }
    
    private func wrongFieldStyle(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.borderWidth = 1.5
    }
    
    private func correctFieldStyle(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.borderWidth = 1
    }
    
    private func enabledLoginButtonStyle() {
        loginScreen?.loginButton.setTitleColor(.white, for: .normal)
        loginScreen?.loginButton.isEnabled = true
        loginScreen?.loginView.alpha = 1
    }
    
    private func disabledLoginButtonStyle() {
        loginScreen?.loginButton.setTitleColor(.lightGray, for: .normal)
        loginScreen?.loginButton.isEnabled = false
        loginScreen?.loginView.alpha = 0.4
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
                
    }
    
}
