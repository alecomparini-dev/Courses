//
//  PostCollectionViewCell.swift
//  BackFront-Posts-Stories
//
//  Created by Alessandro Comparini on 06/03/23.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "PostCollectionViewCell"
    
    private let screen: PostCollectionViewCellScreen = PostCollectionViewCellScreen()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configScreen() {
        contentView.addSubview(screen)
        screen.pin(to: self)
    }
    
    public func setupCell(post: Post) {
        screen.profileImageView.image = UIImage(named: post.profileImage ?? "")
        screen.userNameLabel.text = post.userName
        screen.postImageView.image = UIImage(named: post.postImage ?? "")
    }
    
    
    
}
