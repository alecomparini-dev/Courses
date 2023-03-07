//
//  PostsCollectionViewCellScreen.swift
//  BackFront-Posts-Stories
//
//  Created by Alessandro Comparini on 06/03/23.
//

import UIKit

class PostsCollectionViewCellScreen: UIView {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//  MARK: - Elements
    
    lazy var collectionView: UICollectionView = {
        let lay = UICollectionViewFlowLayout()
        lay.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: lay)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        cv.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: PostCollectionViewCell.identifier)
        return cv
    }()
    
    public func configDelegateCollectionView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }
    
    
//  MARK: - Add Elements and Add Constraints
    private func addElements() {
        addSubview(collectionView)
    }
    
    
    private func configConstraints() {
        collectionView.pin(to: self)
    }
    
    
}
