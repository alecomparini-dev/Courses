//
//  LoginScreen.swift
//  BackFront-1oViewCode
//
//  Created by Alessandro Comparini on 01/03/23.
//

import UIKit

protocol LoginScreenDelegate {
    func tappedLoginButton(_ sender: UIButton)
    
    func tappedOpenChooseButton(_ sender: UIButton)
}


class LoginScreen: UIView {

    private var delegate: LoginScreenDelegate?
    func delegate(delegate: LoginScreenDelegate) {
        self.delegate = delegate
    }
    @objc func tappedLoginButton(_ sender: UIButton) {
        delegate?.tappedLoginButton(sender)
    }
    
    func textFieldsDelegate(delegate: UITextFieldDelegate) {
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Login"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email:"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .white
        return label
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Password:"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .white
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.systemGray2.cgColor
        tf.layer.backgroundColor = UIColor.white.cgColor
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 5
        tf.keyboardType = .emailAddress
        let paddingView = UIView(frame: CGRect(x: 1, y: 1, width: 10, height: tf.frame.height))
        tf.leftView = paddingView
        tf.leftViewMode = .always
        tf.placeholder = "Input your email"
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.systemGray2.cgColor
        tf.layer.backgroundColor = UIColor.white.cgColor
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 5
        tf.isSecureTextEntry = true
        //Para colocar um padding no texto do placeholder
/*        let paragrafo = NSMutableParagraphStyle()
        paragrafo.firstLineHeadIndent = 10
        let atributos: [NSAttributedString.Key: Any] = [
            .paragraphStyle: paragrafo
        ]
        let placeHolder = NSAttributedString(string: "Input your password", attributes: atributos)
        tf.attributedPlaceholder = placeHolder*/
        
        //Melhor forma para fazer padding
        let paddingView = UIView(frame: CGRect(x: 1, y: 1, width: 10, height: tf.frame.height))
        tf.leftView = paddingView
        tf.leftViewMode = .always
        tf.placeholder = "Input your password"
        
        return tf
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor.white.withAlphaComponent(0.3), for: .disabled)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.backgroundColor = UIColor.black.withAlphaComponent(0.2).cgColor
        button.isEnabled = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        return button
    }()
    
    lazy var openAlertButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "calendar"), for: .normal)
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 45), forImageIn: .normal)
        button.tintColor = UIColor.white
        button.addTarget(self, action: #selector(tappedOpenAlertButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedOpenAlertButton(_ sender: UIButton) {
        delegate?.tappedOpenChooseButton(sender)
    }
    
    
    override init(frame: CGRect) {
        print(#function)
        super.init(frame: frame)
        self.backgroundColor = .darkGray
        addElements()
        addConstraintsElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        print(#function)
        self.addSubview(loginLabel)
        self.addSubview(emailLabel)
        self.addSubview(passwordLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        self.addSubview(openAlertButton)
    }
    
    
    private func addConstraintsElements() {
        print(#function)
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 35),
            loginLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            emailLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 120),
            emailLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 25),
            emailLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -25),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor,constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 35),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,constant: 30),
            passwordLabel.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            passwordLabel.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor,constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 35),
            
            
//            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 80),
            loginButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -80),
            loginButton.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            
            openAlertButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 5),
            openAlertButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 25),
            openAlertButton.widthAnchor.constraint(equalToConstant: 60),
            openAlertButton.heightAnchor.constraint(equalToConstant: 60)
            
        ])
    }
    
    

}
