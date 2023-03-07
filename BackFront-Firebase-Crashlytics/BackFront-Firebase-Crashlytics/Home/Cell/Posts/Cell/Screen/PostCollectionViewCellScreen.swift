//
//  PostCollectionViewCellScreen.swift
//  BackFront-Posts-Stories
//
//  Created by Alessandro Comparini on 06/03/23.
//

import UIKit

class PostCollectionViewCellScreen: UIView {


    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//  MARK: - Elements
    
    lazy var view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
        view.setCardShadow()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var likeImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "red-heart")
        img.isHidden = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedLike))
        tap.numberOfTapsRequired = 1
        img.addGestureRecognizer(tap)
        img.isUserInteractionEnabled = true
        return img
    }()
    
    @objc func tappedLike() {
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            self.likeImageView.center.y += 50
        }, completion: { finished in
            self.likeImageView.center.y -= 50
            self.likeImageView.isHidden = true
        })
    }
    
    lazy var profileImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        img.layer.cornerRadius = 20
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    lazy var postImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        img.layer.cornerRadius = 15
        img.contentMode = .scaleAspectFill
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedPostImage))
        tap.numberOfTapsRequired = 2
        img.addGestureRecognizer(tap)
        img.isUserInteractionEnabled = true
        return img
    }()
    
    @objc func tappedPostImage() {
        heartImageView.isHidden = false
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            self.heartImageView.transform = .init(scaleX: 1.8, y: 1.8)
            self.postImageView.transform = .init(scaleX: 1.05, y: 1.05)
            self.likeImageView.center.y += 50
        }, completion: { finished in
            UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                self.postImageView.transform = .identity
                self.likeImageView.center.y -= 50
                self.likeImageView.isHidden = false
            })
            self.heartImageView.transform = .identity
            self.heartImageView.isHidden = true
        })
    }
    
    lazy var heartImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "white-heart")
        img.isHidden = true
        return img
    }()
    

//  MARK: - Add Elements and Add Constraints
    
    private func addElements() {
        addSubview(view)
        view.addSubview(likeImageView)
        view.addSubview(profileImageView)
        view.addSubview(userNameLabel)
        view.addSubview(postImageView)
        view.addSubview(heartImageView)
        
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            profileImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            profileImageView.widthAnchor.constraint(equalToConstant: 40),
            profileImageView.heightAnchor.constraint(equalToConstant: 40),
            
//            likeImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 19),
            likeImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            likeImageView.widthAnchor.constraint(equalToConstant: 25),
            likeImageView.heightAnchor.constraint(equalToConstant: 25),
            likeImageView.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            

            userNameLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            userNameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
            userNameLabel.trailingAnchor.constraint(equalTo: likeImageView.leadingAnchor, constant: -5),
            
            postImageView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10),
            postImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -7),
            postImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 7),
            postImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -7),
            
            heartImageView.centerYAnchor.constraint(equalTo: postImageView.centerYAnchor),
            heartImageView.centerXAnchor.constraint(equalTo: postImageView.centerXAnchor),
            heartImageView.widthAnchor.constraint(equalToConstant: 90),
            heartImageView.heightAnchor.constraint(equalToConstant: 90),
            
            
        ])
        
        
    }
    
    
    
}
