//
//  HomeScreen.swift
//  BackFront-Posts-Stories
//
//  Created by Alessandro Comparini on 06/03/23.
//

import UIKit

class HomeScreen: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .appBackGround
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var collectView : UICollectionView = {
        let lay = UICollectionViewFlowLayout()
        lay.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: lay)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .clear
        cv.register(StoriesCollectionViewCell.self, forCellWithReuseIdentifier: StoriesCollectionViewCell.identifier)
        cv.register(PostsCollectionViewCell.self, forCellWithReuseIdentifier: PostsCollectionViewCell.identifier)
        return cv
    }()

    
    public func delegateCollectionView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        collectView.delegate = delegate
        collectView.dataSource = dataSource
    }
    
    
    private func addElements() {
        addSubview(collectView)
    }
    
    private func configConstraints() {
        collectView.pin(to: self)
    }
    
}
