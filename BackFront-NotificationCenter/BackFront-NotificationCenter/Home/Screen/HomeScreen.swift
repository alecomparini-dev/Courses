//
//  HomeScreen.swift
//  BackFront-NotificationCenter
//
//  Created by Alessandro Comparini on 02/03/23.
//

import UIKit

protocol HomeScreenDeletage: AnyObject {
    func tappedClickHere()
}


class HomeScreen: UIView {

    private weak var delegate: HomeScreenDeletage?
    public func delegate(delegate: HomeScreenDeletage) {
        self.delegate = delegate
    }
    
    
//  MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
//  MARK: - ELEMENTS
    
    lazy var appleImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = UIImage(named: "logo_apple")?.withRenderingMode(.alwaysTemplate)
        imgView.contentMode = .scaleAspectFit
        imgView.tintColor = UIColor.white
        return imgView
    }()
    
    lazy var clickButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.backgroundColor = UIColor.white
        bt.setTitle("Click here", for: .normal)
        bt.setTitleColor(UIColor.black, for: .normal)
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 8
        bt.addTarget(self, action: #selector(tappedClickHereButton), for: .touchUpInside)
        return bt
    }()
    
    
//  MARK: - OBJC FUNCITONS
    
    @objc func tappedClickHereButton(_ sender: UIButton) {
        delegate?.tappedClickHere()
    }
    
    
//  MARK: - ADD SUBVIEW
    private func addElements() {
        addSubview(appleImageView)
        addSubview(clickButton)
    }
    
    
    
//  MARK: - ADD CONSTRAINTS
    
    private func configConstraints() {
        
        NSLayoutConstraint.activate([
            appleImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            appleImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -90),
            appleImageView.heightAnchor.constraint(equalToConstant: 200),
            appleImageView.widthAnchor.constraint(equalToConstant: 200),
            
            
            clickButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -80),
            clickButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 25),
            clickButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -25),
            clickButton.heightAnchor.constraint(equalToConstant: 45)
            
        ])
        
        
    }
    
    
}
