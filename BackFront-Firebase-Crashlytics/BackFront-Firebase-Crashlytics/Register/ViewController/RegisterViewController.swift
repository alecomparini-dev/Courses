//
//  RegisterViewController.swift
//  BackFront-Firebase-Crashlytics
//
//  Created by Alessandro Comparini on 07/03/23.
//

import UIKit

class RegisterViewController: UIViewController {

    private let registerScreen: RegisterScreen = RegisterScreen()
    private let viewModel: RegisterViewModel = RegisterViewModel()

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = registerScreen
        configScreen()
    }
    
    private func configScreen() {
        configNavigationBar()
        configDelegateRegisterScreen()
    }
    
    private func configNavigationBar() {
        navigationController?.navigationBar.tintColor = UIColor.black.withAlphaComponent(0.8)
    }
    
    private func configDelegateRegisterScreen() {
        registerScreen.delegateRegisterScreen(delegate: self)
    }

}

extension RegisterViewController: RegisterScreenDelegate {
    func tappedSignUp() {
        viewModel.createUser(email: registerScreen.emailTextField.text ?? "", password: registerScreen.passwordTextField.text ?? "", completion: returnCreateUser)
    }
    
    func returnCreateUser(error: String?) {
        if error != nil {
            print("Fazer um alert para informar que deu Erro !!!", error ?? "")
            return
        }
        let homeScreenVC = HomeViewController()
        navigationController?.pushViewController(homeScreenVC, animated: true)
    }
    
}
