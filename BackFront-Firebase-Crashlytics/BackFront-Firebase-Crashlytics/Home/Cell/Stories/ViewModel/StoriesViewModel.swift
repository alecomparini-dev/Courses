//
//  StoriesViewModel.swift
//  BackFront-Posts-Stories
//
//  Created by Alessandro Comparini on 06/03/23.
//

import UIKit

class StoriesViewModel {

    private var listStories: [Story]
    
    init(listStories stories: [Story]) {
        self.listStories = stories
    }
    
    public var numberOfItems: Int {
        self.listStories.count
    }
    
    public func loadCurrentStory(index: Int) -> Story {
        return self.listStories[index]
    }
    
    public func sizeForItem(_ frame: CGRect) -> CGSize {
        return CGSize(width: 100, height: frame.height)
    }
    
    public func cellForItem(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> StoryCollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.identifier, for: indexPath) as? StoryCollectionViewCell ?? StoryCollectionViewCell()
    }
    
}
