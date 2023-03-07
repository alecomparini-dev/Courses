//
//  StoriesCollectionViewCell.swift
//  BackFront-Posts-Stories
//
//  Created by Alessandro Comparini on 06/03/23.
//

import UIKit

class StoriesCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "StoriesCollectionViewCell"
    private let screen: StoriesCollectionViewCellScreen = StoriesCollectionViewCellScreen()
    
    private var viewModel: StoriesViewModel?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configScreen()
        configDelegateCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configScreen() {
        contentView.addSubview(screen)
        screen.pin(to: self)
    }
    
    
    private func configDelegateCollectionView() {
        screen.configDelegatesCollectionView(delegate: self, dataSource: self)
    }
    
    
    public func setupCell(listStories: [Story]) {
        viewModel = StoriesViewModel(listStories: listStories)
    }
    
}

extension StoriesCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.numberOfItems ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let viewModel else { return UICollectionViewCell() }
        let cell = viewModel.cellForItem(collectionView, indexPath) 
        cell.setupCell(story: viewModel.loadCurrentStory(index: indexPath.row), indexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let viewModel else {return CGSize(width: 0, height: 0)}
        
        return viewModel.sizeForItem(collectionView.frame)
        
    }
    
}
