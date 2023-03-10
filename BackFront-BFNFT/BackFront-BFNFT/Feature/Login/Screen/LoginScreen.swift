//
//  LoginScreen.swift
//  BackFront-BFNFT
//
//  Created by Alessandro Comparini on 10/03/23.
//

import UIKit
import SnapKit

protocol LoginScreenDelegate: AnyObject {
    func tappedForgotButton()
    func tappedLoginButton()
    func tappedSignInMetaMask()
    func tappedSignUpButton()
}

class LoginScreen: UIView {

    private weak var delegate: LoginScreenDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//  MARK: - Delegates TextFields
    public func configTextFieldsDelegate(delegate: UITextFieldDelegate) {
        emailTextField.delegate = delegate
        passworldTextField.delegate = delegate
    }
    
    public func configLoginScreenDelegate(delegate: LoginScreenDelegate) {
        self.delegate = delegate
    }
    
    
//  MARK: - Create Elements
    lazy var backgroundImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "BG Login")
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    lazy var logoImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "BFLogin")
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    lazy var logoLabel: UILabel = {
        let label = UILabel()
        label.text = "BF NFT"
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.textAlignment = .center
        label.textColor = UIColor.white
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "The BackFront Academy NFT's marketplace"
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.textAlignment = .center
        label.textColor = UIColor.white
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.white.cgColor
        tf.backgroundColor = UIColor.textfieldBackGround
        tf.textColor = UIColor.white
        tf.keyboardType = .emailAddress
        //placeholder
        tf.attributedPlaceholder = NSAttributedString(string: "E-mail", attributes: [
            NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)
        ])
        //padding
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tf.frame.height))
        tf.leftView = padding
        tf.leftViewMode = .always
        tf.configAccessibility(label: "Input your email")
        return tf
    }()
    
    lazy var passworldTextField: UITextField = {
        let tf = UITextField()
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.white.cgColor
        tf.backgroundColor = UIColor.textfieldBackGround
        tf.textColor = UIColor.white
        tf.keyboardType = .default
        tf.isSecureTextEntry = true
        //placeholder
        tf.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [
            NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)
        ])
        //padding
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tf.frame.height))
        tf.leftView = padding
        tf.leftViewMode = .always
        return tf
    }()

    lazy var forgotButton: UIButton  = {
        let btn = UIButton(type: .system)
        btn.setTitle("Forgot password?", for: .normal)
        btn.setTitleColor(UIColor.primaryColor, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btn.addTarget(self, action: #selector(tappedForgotButton), for: .touchUpInside)
        return btn
    }()
    @objc func tappedForgotButton() {
        print(#function)
    }
    
    lazy var loginView: UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.layer.cornerRadius = 8
        img.image = UIImage(named: "gradient3")
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    lazy var loginButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 8
        bt.setTitle("Login", for: .normal)
        bt.setTitleColor(UIColor.white, for: .normal)
        bt.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        bt.titleLabel?.textAlignment = .center
        bt.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        bt.configAccessibility(label: "Login", trait: .button)
        return bt
    }()
    @objc func tappedLoginButton() {
        print(#function)
    }
    
    lazy var lineView: UIView = {
        let vw = UIView()
        vw.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        return vw
    }()
    
    lazy var signInMetaMaskView: UIView = {
        let vw = UIView()
        vw.clipsToBounds = true
        vw.layer.cornerRadius = 8
        vw.layer.borderColor = UIColor.primaryColor.cgColor
        vw.layer.borderWidth = 2
        vw.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedSignInMetaMask))
        vw.addGestureRecognizer(tap)
        return vw
    }()
    @objc func tappedSignInMetaMask() {
        print(#function)
    }
    
    lazy var logoMetaMaskImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "logo")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var logoMetaMaskLabel: UILabel = {
        let label = UILabel()
        label.text = "Signin with MetaMask"
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textAlignment = .center
        label.textColor = UIColor.white
        return label
    }()
    
    lazy var signUpButton: UIButton  = {
        let btn = UIButton(type: .system)
        btn.setTitle("Sign up!", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        btn.addTarget(self, action: #selector(tappedSignUpButton), for: .touchUpInside)
        return btn
    }()
    @objc func tappedSignUpButton() {
        print(#function)
    }
    
    
//  MARK: - Add Elements and Constraints
    private func addElements() {
        addSubview(backgroundImageView)
        addSubview(logoImageView)
        addSubview(logoLabel)
        addSubview(descriptionLabel)
        addSubview(emailTextField)
        addSubview(passworldTextField)
        addSubview(forgotButton)
        addSubview(loginView)
        addSubview(loginButton)
        addSubview(lineView)
        addSubview(signInMetaMaskView)
        signInMetaMaskView.addSubview(logoMetaMaskLabel)
        signInMetaMaskView.addSubview(logoMetaMaskImageView)
        addSubview(signUpButton)
    }
    
    private func configConstraints() {
        configBackgroundImageViewConstraints()
        configLogoImageViewConstraints()
        configLogoLabelConstraints()
        configDescriptionLabelConstraints()
        configEmailTextFieldConstraints()
        configPassworldTextFieldConstraints()
        configForgotButtonConstraints()
        configLoginViewConstraints()
        configLoginButtonConstraints()
        configLineViewConstraints()
        configSignInMetaMaskViewConstraints()
        configLogoMetaMaskLabelConstraints()
        configLogoMetaMaskImageViewConstraints()
        configSignUpButtonConstraints()
    }
    
    
    private func configBackgroundImageViewConstraints() {
        backgroundImageView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    private func configLogoImageViewConstraints() {
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(25)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.width.height.equalTo(80)
        }
    }
    
    private func configLogoLabelConstraints() {
        logoLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(15)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(20)
        }
    }
    
    private func configDescriptionLabelConstraints() {
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(logoLabel.snp.bottom)
            make.leading.trailing.equalTo(logoLabel)
        }
    }
    
    private func configEmailTextFieldConstraints() {
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(35)
            make.leading.trailing.equalTo(descriptionLabel)
            make.height.equalTo(35)
        }
    }
    
    private func configPassworldTextFieldConstraints() {
        passworldTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(15)
            make.leading.trailing.height.equalTo(emailTextField)
        }
    }
    
    private func configForgotButtonConstraints() {
        forgotButton.snp.makeConstraints { make in
            make.top.equalTo(passworldTextField.snp.bottom).offset(5)
            make.trailing.equalTo(passworldTextField.snp.trailing).inset(10)
            make.height.equalTo(20)
        }
    }
    
    private func configLoginViewConstraints() {
        loginView.snp.makeConstraints { make in
            make.top.equalTo(forgotButton.snp.bottom).offset(40)
            make.leading.equalTo(passworldTextField.snp.leading)
            make.trailing.equalTo(passworldTextField.snp.trailing)
            make.height.equalTo(40)
        }
    }
    
    private func configLoginButtonConstraints() {
        loginButton.snp.makeConstraints { make in
            make.top.trailing.leading.bottom.equalTo(loginView)
        }
    }
    
    private func configLineViewConstraints() {
        lineView.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(35)
            make.leading.equalTo(loginView.snp.leading).offset(35)
            make.trailing.equalTo(loginView.snp.trailing).inset(35)
            make.height.equalTo(1)
        }
    }
    
    private func configSignInMetaMaskViewConstraints() {
        signInMetaMaskView.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(35)
            make.leading.trailing.equalTo(loginView)
            make.height.equalTo(35)
        }
    }
    
    private func configSignUpButtonConstraints() {
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(signInMetaMaskView.snp.bottom).offset(10)
            make.trailing.height.equalTo(signInMetaMaskView).inset(10)
        }
    }
    
    private func configLogoMetaMaskLabelConstraints() {
        logoMetaMaskLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(signInMetaMaskView)
        }
    }

    private func configLogoMetaMaskImageViewConstraints() {
        logoMetaMaskImageView.snp.makeConstraints { make in
            make.centerY.equalTo(signInMetaMaskView.snp.centerY)
            make.trailing.equalTo(logoMetaMaskLabel.snp.leading)
            make.height.equalTo(20)
        }
    }
    


}
