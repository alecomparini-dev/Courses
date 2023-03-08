//
//  HomeViewModel.swift
//  BackFront-Posts-Stories
//
//  Created by Alessandro Comparini on 06/03/23.
//

import UIKit

class HomeViewModel {

    private var stories: [Story] = []
    private var posts: [Post] = []
    private let service: HomeService = HomeService()
    
    public func getStories() -> [Story] {
        return self.stories
    }
    
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
    
    
    public func fetchAllRequest() {
        service.getAllDataJsonFile { homeData, error in
            if error == nil {
                self.posts = homeData?.posts ?? []
                self.stories = homeData?.stories ?? []
            }
        }
    }
    
    
}
