//
//  LoginScreen.swift
//  BackFront-Firebase-Crashlytics
//
//  Created by Alessandro Comparini on 07/03/23.
//

import UIKit
import SnapKit

protocol LoginScreenDelegate: AnyObject {
    func tappedContinueButton()
    func tappedSignUpButton()
}

class LoginScreen: UIView {

    private weak var delegate: LoginScreenDelegate?
    public func loginScreenDelegate(delegate: LoginScreenDelegate) {
        self.delegate = delegate
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.appBackGround
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
//  MARK: - ELEMENTS
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Email" , attributes: [
            NSAttributedString.Key.foregroundColor : UIColor.black.withAlphaComponent(0.3)
        ])
        tf.textColor = UIColor.black.withAlphaComponent(0.9)
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 12
        tf.layer.borderColor = UIColor.black.withAlphaComponent(0.7).cgColor
        tf.layer.borderWidth = 1
        tf.keyboardType = .emailAddress
        let padding = UIView(frame: CGRect(x: 1, y: 1, width: 15, height: tf.frame.height))
        tf.leftView = padding
        tf.leftViewMode = .always
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Password" , attributes: [
            NSAttributedString.Key.foregroundColor : UIColor.black.withAlphaComponent(0.3)
        ])
        tf.textColor = UIColor.black.withAlphaComponent(0.9)
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 12
        tf.layer.borderColor = UIColor.black.withAlphaComponent(0.7).cgColor
        tf.layer.borderWidth = 1
        let padding = UIView(frame: CGRect(x: 1, y: 1, width: 10, height: tf.frame.height))
        tf.leftView = padding
        tf.leftViewMode = .always
        tf.isSecureTextEntry = true
        return tf
    }()
    
    lazy var continueButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Continue", for: .normal)
        btn.addTarget(self, action: #selector(tappedContinueButton), for: .touchUpInside)
        btn.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        btn.setTitleColor(UIColor.white.withAlphaComponent(0.8), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 8
        return btn
    }()
    
    @objc func tappedContinueButton() {
        delegate?.tappedContinueButton()
    }
    
    lazy var signUpButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Sign Up", for: .normal)
        btn.setTitleColor(UIColor.black.withAlphaComponent(0.7), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        btn.addTarget(self, action: #selector(tappedSignUpButton), for: .touchUpInside)
        return btn
    }()
    
    @objc func tappedSignUpButton() {
        delegate?.tappedSignUpButton()
    }
    
    
//  MARK: - ADD ELEMENTS and CONSTRAINTS
    
    private func addElements() {
        addSubview(titleLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(continueButton)
        addSubview(signUpButton)
    }
    
    private func configConstraints() {
        configTitleLabelConstraints()
        configEmailTextFieldConstraints()
        configPasswordTextFieldConstraints()
        configContinueButtonConstraints()
        configSignUpButtonConstraints()
    }
   
    private func configTitleLabelConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(60)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(25)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(25)
         }
    }
    
    private func configEmailTextFieldConstraints() {
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(60)
            make.leading.trailing.equalTo(titleLabel)
            make.height.equalTo(40)
        }
    }
    
    private func configPasswordTextFieldConstraints() {
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(25)
            make.leading.trailing.height.equalTo(emailTextField)
        }
    }

    private func configContinueButtonConstraints() {
        continueButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(80)
            make.leading.trailing.equalTo(passwordTextField)
            make.height.equalTo(50)
        }
    }
    
    private func configSignUpButtonConstraints() {
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(continueButton.snp.bottom).offset(20)
            make.trailing.equalTo(continueButton).inset(10)
        }
    }
    
    
//  MARK: - DELEGATES
    public func textFieldsDelegate(delegate: UITextFieldDelegate) {
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
    
}
