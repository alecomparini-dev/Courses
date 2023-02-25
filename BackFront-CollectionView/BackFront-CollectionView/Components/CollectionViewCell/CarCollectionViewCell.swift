//
//  CarCollectionViewCell.swift
//  BackFront-CollectionView
//
//  Created by Alessandro Comparini on 25/02/23.
//

import UIKit

class CarCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var carImageView: UIImageView!
    
    
    static let identifier: String = "CarCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        carImageView.contentMode = .scaleAspectFill
        
    }
    
    func setupCell(car: Car) {
        carImageView.image = car.imageBrand
    }

}
