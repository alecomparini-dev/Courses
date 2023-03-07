//
//  StoryCollectionViewCellScreen.swift
//  BackFront-Posts-Stories
//
//  Created by Alessandro Comparini on 06/03/23.
//

import UIKit

class StoryCollectionViewCellScreen: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//  MARK: - Elements
    
    lazy var profileImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 35
        return img
    }()
    
    lazy var addButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setBackgroundImage(UIImage(systemName: "plus.circle.fill")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.imageView?.tintColor = .blue
        btn.backgroundColor = .white
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 12.5
        return btn
    }()
    
    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    
    private func addElements() {
        addSubview(profileImageView)
        addSubview(addButton)
        addSubview(userNameLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            profileImageView.widthAnchor.constraint(equalToConstant: 70),
            profileImageView.heightAnchor.constraint(equalToConstant: 70),
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
//            profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            profileImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            
            addButton.widthAnchor.constraint(equalToConstant: 25),
            addButton.heightAnchor.constraint(equalToConstant: 25),
            addButton.trailingAnchor.constraint(equalTo: profileImageView.trailingAnchor),
            addButton.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor),
            
            
            userNameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor),
            userNameLabel.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor),
            userNameLabel.trailingAnchor.constraint(equalTo: profileImageView.trailingAnchor),
            
        ])
    }
    
}
