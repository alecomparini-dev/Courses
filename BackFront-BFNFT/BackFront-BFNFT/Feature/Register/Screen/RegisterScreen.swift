//
//  RegisterScreen.swift
//  BackFront-BFNFT
//
//  Created by Alessandro Comparini on 10/03/23.
//

import UIKit
import SnapKit

class RegisterScreen: UIView {


    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    lazy var tileLabel: UILabel = {
        let label = UILabel()
        label.text = "Register"
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.textAlignment = .center
        label.textColor = UIColor.white
        return label
    }()
    
//  MARK: - Add Elements and Constraints
    private func addElements() {
        addSubview(backgroundImageView)
        addSubview(logoImageView)
        addSubview(tileLabel)
    }
    
    private func configConstraints() {
        configBackgroundImageViewConstraints()
        configLogoImageViewConstraints()
        configTitleLabelConstraints()
    }
    
    private func configBackgroundImageViewConstraints() {
        backgroundImageView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalTo(safeAreaLayoutGuide)
        }
        
    }

    private func configLogoImageViewConstraints() {
       
    }

    private func configTitleLabelConstraints() {
       
    }
    
    
}
