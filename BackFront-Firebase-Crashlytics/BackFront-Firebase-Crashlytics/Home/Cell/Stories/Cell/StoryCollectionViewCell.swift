//
//  StoryCollectionViewCell.swift
//  BackFront-Posts-Stories
//
//  Created by Alessandro Comparini on 06/03/23.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "StoryCollectionViewCell"
    private let storyScreen: StoryCollectionViewCellScreen = StoryCollectionViewCellScreen()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configScreen()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configScreen() {
        contentView.addSubview(storyScreen)
        storyScreen.pin(to: contentView)
    }
    
    public func setupCell(story: Story, indexPath: IndexPath) {
        storyScreen.profileImageView.image = UIImage(named: story.image ?? "")
        storyScreen.userNameLabel.text = story.userName
        storyScreen.addButton.isHidden = indexPath.row != 0
    }
    
}
