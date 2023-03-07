//
//  PostsCollectionViewCell.swift
//  BackFront-Posts-Stories
//
//  Created by Alessandro Comparini on 06/03/23.
//

import UIKit

class PostsCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "PostsCollectionViewCell"
    private let screen: PostsCollectionViewCellScreen = PostsCollectionViewCellScreen()
    
    private var viewModel: PostsViewModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configScreen()
        configConstraints()
        configDelegateCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configScreen() {
        contentView.addSubview(screen)
    }
    
    private func configConstraints() {
        screen.pin(to: self)
    }
    
    private func configDelegateCollectionView() {
        screen.configDelegateCollectionView(delegate: self, dataSource: self)
    }
    
    public func setCell(listPosts: [Post]) {
        viewModel = PostsViewModel(listPosts: listPosts)
    }
    
}

//  MARK: - Extension

extension PostsCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.numberOfItems ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let viewModel else { return UICollectionViewCell() }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.identifier, for: indexPath) as? PostCollectionViewCell
        cell?.setupCell(post: viewModel.loadCurrentPost(index: indexPath.row))
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let viewModel else { return CGSize(width: 0, height: 0) }
       
        return viewModel.sizeForItem(collectionView)
    }
}

