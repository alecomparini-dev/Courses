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
    
    lazy var backGroundImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.image = UIImage(named: "BG Login")
        return img
    }()
    
    
    
    //MARK- Functions
    private func addElements() {
        addSubview(backGroundImage)
    }
    
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            backGroundImage.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backGroundImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            backGroundImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backGroundImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
        ])
    }
    
}
