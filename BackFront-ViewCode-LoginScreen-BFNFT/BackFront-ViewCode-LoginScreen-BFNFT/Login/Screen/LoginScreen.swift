//
//  LoginScreen.swift
//  BackFront-ViewCode-LoginScreen-BFNFT
//
//  Created by Alessandro Comparini on 02/03/23.
//

import UIKit


class LoginScreen: UIView {

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
    
    lazy var logoImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "BFLogin")
        return img
    }()

    lazy var logoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "BF NFT"
        label.font = UIFont.boldSystemFont(ofSize: 50)
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
        tf.attributedPlaceholder = NSAttributedString(string: "Login", attributes: [
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
    
    
    
    
    //MARK: - Add SubView
    
    private func addElements() {
        addSubview(backGroundImage)
        addSubview(logoImage)
        addSubview(logoLabel)
        addSubview(descriptionLabel)
        addSubview(loginTextField)
        addSubview(passwordTextField)
    }
    
    
    //MARK: - Add Constraints
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            backGroundImage.topAnchor.constraint(equalTo: topAnchor),
            backGroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            backGroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backGroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            
            logoImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            logoImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: 120),
            logoImage.heightAnchor.constraint(equalToConstant: 120),
            
            
            logoLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 15),
            logoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: logoLabel.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            loginTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 45),
            loginTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            loginTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            loginTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: loginTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: loginTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: loginTextField.heightAnchor),
            
            
        ])
    }
    
    

    
}
