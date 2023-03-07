//
//  StoriesCollectionViewCellScreen.swift
//  BackFront-Posts-Stories
//
//  Created by Alessandro Comparini on 06/03/23.
//

import UIKit

class StoriesCollectionViewCellScreen: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//  MARK: - ELEMENTS
    lazy var view : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
        view.setCardShadow()
        view.backgroundColor = .white
        return view
    }()

    lazy var collectView : UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        cv.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: StoryCollectionViewCell.identifier)
        return cv
    }()
    
    public func configDelegatesCollectionView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        collectView.delegate = delegate
        collectView.dataSource = dataSource
    }
    
    private func addElements() {
        addSubview(view)
        view.addSubview(collectView)
    }
    
    private func configContraints() {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            view.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])
        collectView.pin(to: view)
    }
}
