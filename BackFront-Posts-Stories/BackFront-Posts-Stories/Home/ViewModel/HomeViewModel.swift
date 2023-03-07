//
//  HomeViewModel.swift
//  BackFront-Posts-Stories
//
//  Created by Alessandro Comparini on 06/03/23.
//

import UIKit

class HomeViewModel {

    private let stories: [Story] = [
        Story(imageProfile: "img1", userName: "Add Story"),
        Story(imageProfile: "img2", userName: "Alessandro"),
        Story(imageProfile: "img3", userName: "Consagrado"),
        Story(imageProfile: "img4", userName: "Nívea"),
        Story(imageProfile: "img5", userName: "Teste"),
        Story(imageProfile: "img6", userName: "Muito Loco"),
        Story(imageProfile: "img7", userName: "É noiss"),
    ]
    
    public func getStories() -> [Story] {
        return self.stories
    }
    
    
    private let posts: [Post] = [
        Post(profileImage: "img2", userName: "Alessandro", postImage: "post1"),
        Post(profileImage: "img3", userName: "Consagrado", postImage: "post2"),
        Post(profileImage: "img4", userName: "Nívea", postImage: "post3"),
        Post(profileImage: "img6", userName: "Muito Loco", postImage: "post4")
    ]
    
    public func getPosts() -> [Post] {
        return self.posts
    }
    
    public var numberOfItems: Int {
        2
    }
    
    public func sizeForItem(_ indexPath: IndexPath, _ frame: CGRect) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: frame.width, height: 120)
        }
        return CGSize(width: frame.width, height: frame.height - 130)
    }
    
    
}
