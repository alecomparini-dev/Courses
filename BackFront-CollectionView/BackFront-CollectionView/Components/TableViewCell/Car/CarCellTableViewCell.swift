//
//  CarCellTableViewCell.swift
//  BackFront-CollectionView
//
//  Created by Alessandro Comparini on 25/02/23.
//

import UIKit

class CarCellTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var brandLabel: UILabel!
    
    static let identifier: String = "CarCellTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    let listCar: [Car] = [
        Car(brand: "Bentley", imageBrand: UIImage(named: "Bentley") ?? UIImage()),
        Car(brand: "BMW", imageBrand: UIImage(named: "BMW") ?? UIImage()),
        Car(brand: "Ford", imageBrand: UIImage(named: "Ford") ?? UIImage()),
        Car(brand: "Honda", imageBrand: UIImage(named: "Honda") ?? UIImage()),
        Car(brand: "Hyundai", imageBrand: UIImage(named: "Hyundai") ?? UIImage()),
        Car(brand: "Mercedes-Benz", imageBrand: UIImage(named: "Mercedes-Benz") ?? UIImage()),
        Car(brand: "Nissan", imageBrand: UIImage(named: "Nissan") ?? UIImage()),
        Car(brand: "Subaru", imageBrand: UIImage(named: "Subaru") ?? UIImage()),
        Car(brand: "Toyota", imageBrand: UIImage(named: "Toyota") ?? UIImage()),
        Car(brand: "Volskwagen", imageBrand: UIImage(named: "Volskwagen") ?? UIImage())
    ]
    
    func setBrand(brand: String) {
        brandLabel.text = brand
    }
 
    override func awakeFromNib() {
        super.awakeFromNib()
        configCollectionView()
    }
    
    func configCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CarCollectionViewCell.nib(), forCellWithReuseIdentifier: CarCollectionViewCell.identifier)
        configLayout()
    }
    
    func configLayout() {
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.estimatedItemSize = .zero
        }
    }
    
    
}

extension CarCellTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listCar.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarCollectionViewCell.identifier, for: indexPath) as? CarCollectionViewCell
        
        cell?.setupCell(car: listCar[indexPath.row])
        
        return cell ?? UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: contentView.frame.width, height: 380)
    }
    
    
}
