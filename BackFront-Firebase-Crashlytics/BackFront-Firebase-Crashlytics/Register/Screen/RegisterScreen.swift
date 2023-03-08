//
//  RegisterViewControllerScreen.swift
//  BackFront-Firebase-Crashlytics
//
//  Created by Alessandro Comparini on 07/03/23.
//

import UIKit
import SnapKit

protocol RegisterScreenDelegate: AnyObject {
    func tappedSignUp()
}

class RegisterScreen: UIView {

    private weak var delegate: RegisterScreenDelegate?
    public func delegateRegisterScreen(delegate: RegisterScreenDelegate) {
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
        label.text = "Sign Up"
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
    
    lazy var confirmPasswordTextField: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Confirm password" , attributes: [
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
    
    lazy var signUpButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Sign Up", for: .normal)
        btn.addTarget(self, action: #selector(tappedSignUpButton), for: .touchUpInside)
        btn.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        btn.setTitleColor(UIColor.white.withAlphaComponent(0.8), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 8
        return btn
    }()
    
    @objc func tappedSignUpButton() {
        delegate?.tappedSignUp()
    }
    
    
    
//  MARK: - Add Elements and Constraints
    private func addElements() {
        addSubview(titleLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(confirmPasswordTextField)
        addSubview(signUpButton)
    }
    
    private func configConstraints() {
        configTitleLabelConstraints()
        configEmailTextFieldConstraints()
        configPasswordTextFieldConstraints()
        configConfirmPasswordTextFieldConstraints()
        configSignUpButtonConstraints()
    }
   
    private func configTitleLabelConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(22)
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

    private func configConfirmPasswordTextFieldConstraints() {
        confirmPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(25)
            make.leading.trailing.height.equalTo(passwordTextField)
        }
    }

    private func configSignUpButtonConstraints() {
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(confirmPasswordTextField.snp.bottom).offset(50)
            make.leading.trailing.equalTo(confirmPasswordTextField)
            make.height.equalTo(50)
        }
    }


//  MARK: - Delegates

    public func delegateTextField(delegate: UITextFieldDelegate) {
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
        confirmPasswordTextField.delegate = delegate
    }
    
}
