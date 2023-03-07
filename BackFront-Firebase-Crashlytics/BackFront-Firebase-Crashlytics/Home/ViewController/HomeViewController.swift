//
//  HomeViewController.swift
//  BackFront-Posts-Stories
//
//  Created by Alessandro Comparini on 06/03/23.
//

import UIKit

class HomeViewController: UIViewController {

    private let homeScreen: HomeScreen = HomeScreen()
    private let homeViewModel: HomeViewModel = HomeViewModel()
    
    override func loadView() {
        super.loadView()
        view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configDelegateCollectionView()
    }
    
    private func configDelegateCollectionView() {
        homeScreen.delegateCollectionView(delegate: self, dataSource: self)
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        homeViewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoriesCollectionViewCell.identifier, for: indexPath) as? StoriesCollectionViewCell
            cell?.setupCell(listStories: homeViewModel.getStories())
            return cell ?? UICollectionViewCell()
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostsCollectionViewCell.identifier, for: indexPath) as? PostsCollectionViewCell
        cell?.setCell(listPosts: homeViewModel.getPosts())
        return cell ?? UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return homeViewModel.sizeForItem(indexPath, collectionView.frame)
    }
    
    
}
