//
//  PostsViewModel.swift
//  BackFront-Posts-Stories
//
//  Created by Alessandro Comparini on 06/03/23.
//

import UIKit

class PostsViewModel {

    private var listPosts: [Post]
    
    init(listPosts: [Post]) {
        self.listPosts = listPosts
    }
    
    public var numberOfItems: Int {
        self.listPosts.count
    }
    
    public func sizeForItem(_ collectionView: UICollectionView) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 430)
    }
    
    public func loadCurrentPost(index: Int) -> Post {
        return self.listPosts[index]
    }

    
}
