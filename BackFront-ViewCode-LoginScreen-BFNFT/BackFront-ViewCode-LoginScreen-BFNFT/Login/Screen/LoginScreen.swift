//
//  LoginScreen.swift
//  BackFront-ViewCode-LoginScreen-BFNFT
//
//  Created by Alessandro Comparini on 02/03/23.
//

import UIKit

protocol LoginScreenDelegate {
    func tappedForgotPassword()
    func tappedLogin()
}


class LoginScreen: UIView {

    private var delegate: LoginScreenDelegate?
    public func delegate(delegate: LoginScreenDelegate) {
        self.delegate = delegate
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Elements
    
    lazy var backGroundImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.image = UIImage(named: "BG Login")
        return img
    }()
    
    lazy var logoImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "BFLogin")
        return img
    }()

    lazy var logoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "BF NFT"
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = UIColor.white
        label.textAlignment = .center
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "The Backfront Academy NFT`s marketplace"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var loginTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.keyboardType = .emailAddress
        tf.attributedPlaceholder = NSAttributedString(string: "E-mail", attributes: [
            NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)
        ])
        tf.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1)
        tf.textColor = UIColor.white
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 12
        tf.borderStyle = .roundedRect
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.white.cgColor
        let padding = UIView(frame: CGRect(x: 1, y: 1, width: 5, height: tf.frame.height))
        tf.leftView = padding
        tf.leftViewMode = .always
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.keyboardType = .default
        tf.isSecureTextEntry = true
        tf.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [
            NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)
        ])
        tf.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1)
        tf.textColor = UIColor.white
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 12
        tf.borderStyle = .roundedRect
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.white.cgColor
        let padding = UIView(frame: CGRect(x: 1, y: 1, width: 5, height: tf.frame.height))
        tf.leftView = padding
        tf.leftViewMode = .always
        return tf
    }()
    
    
    lazy var forgotButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Forgot password?", for: .normal)
        bt.setTitleColor(UIColor(red: 231/255, green: 48/255, blue: 214/255, alpha: 1), for: .normal)
        bt.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        bt.addTarget(self, action: #selector(tappedForgotButton), for: .touchUpInside)
        return bt
    }()

    
    lazy var loginImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "gradient3")
        img.clipsToBounds = true
        img.layer.cornerRadius = 7
        return img
    }()
    
    
    lazy var loginButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Login", for: .normal)
        bt.setTitleColor(UIColor.white, for: .normal)
        bt.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        bt.titleLabel?.textAlignment = .center
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 8
        bt.addTarget(self, action: #selector(tappedForgotButton), for: .touchUpInside)
        return bt
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        return view
    }()
    
    
    lazy var signInStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.clipsToBounds = true
        sv.layer.cornerRadius = 8
        sv.layer.borderColor = UIColor(red: 231/255, green: 48/255, blue: 214/255, alpha: 1).cgColor
        sv.layer.borderWidth = 2
        return sv
    }()
    
    
    lazy var signInImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "logo")
        return img
    }()
    
    lazy var signInLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "SignIn with Metamask"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = UIColor.white
        label.textAlignment = .center
        return label
    }()
    
    //MARK: - Objc Functions
    
    @objc func tappedForgotButton(_ sender: UIButton) {
        delegate?.tappedForgotPassword()
    }

    @objc func tappedLoginButton(_ sender: UIButton) {
        delegate?.tappedLogin()
    }
    
    
    //MARK: - Add SubView
    
    private func addElements() {
        addSubview(backGroundImage)
        addSubview(logoImageView)
        addSubview(logoLabel)
        addSubview(descriptionLabel)
        addSubview(loginTextField)
        addSubview(passwordTextField)
        addSubview(forgotButton)
        addSubview(loginImageView)
        loginImageView.addSubview(loginButton)
        addSubview(lineView)
        addSubview(signInStackView)
        signInStackView.addSubview(signInImageView)
        signInStackView.addSubview(signInLabel)
    }
    
    
    //MARK: - Add Constraints
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            backGroundImage.topAnchor.constraint(equalTo: topAnchor),
            backGroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            backGroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backGroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 35),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 80),
            logoImageView.heightAnchor.constraint(equalToConstant: 80),
        ])
        
        NSLayoutConstraint.activate([
            logoLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 15),
            logoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: logoLabel.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            loginTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 45),
            loginTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            loginTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            loginTextField.heightAnchor.constraint(equalToConstant: 40),

        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: loginTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: loginTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: loginTextField.heightAnchor),
            
        ])
        
        NSLayoutConstraint.activate([
            forgotButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,constant: 5),
            forgotButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: -5),
            forgotButton.heightAnchor.constraint(equalToConstant: 30),
            
        ])
        
        NSLayoutConstraint.activate([
            loginImageView.topAnchor.constraint(equalTo: forgotButton.bottomAnchor, constant: 40),
            loginImageView.leadingAnchor.constraint(equalTo: loginTextField.leadingAnchor),
            loginImageView.trailingAnchor.constraint(equalTo: loginTextField.trailingAnchor),
            loginImageView.heightAnchor.constraint(equalTo: loginTextField.heightAnchor),
            
        ])
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: loginImageView.topAnchor),
            loginButton.bottomAnchor.constraint(equalTo: loginImageView.bottomAnchor),
            loginButton.leadingAnchor.constraint(equalTo: loginImageView.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: loginImageView.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 45),
            lineView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 70),
            lineView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -70),
            lineView.heightAnchor.constraint(equalToConstant: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            signInStackView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 45),
            signInStackView.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor),
            signInStackView.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor),
            signInStackView.heightAnchor.constraint(equalTo: loginButton.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            signInLabel.centerXAnchor.constraint(equalTo: signInStackView.centerXAnchor),
            signInLabel.centerYAnchor.constraint(equalTo: signInStackView.centerYAnchor),
            
        ])
        
        
        NSLayoutConstraint.activate([
            signInImageView.centerYAnchor.constraint(equalTo: signInStackView.centerYAnchor),
            signInImageView.trailingAnchor.constraint(equalTo: signInLabel.leadingAnchor, constant: -5),
            signInImageView.heightAnchor.constraint(equalTo: signInStackView.heightAnchor, constant: -17),
        ])
        
        
    }
    
    

    
}
