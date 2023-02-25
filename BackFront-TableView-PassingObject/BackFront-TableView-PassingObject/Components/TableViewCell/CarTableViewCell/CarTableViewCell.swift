//
//  CarTableViewCell.swift
//  BackFront-TableView-PassingObject
//
//  Created by Alessandro Comparini on 24/02/23.
//

import UIKit

class CarTableViewCell: UITableViewCell {

    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var brandImageView: UIImageView!
    
    static let identifier: String = "CarTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .default
    }
    
    func setupCell(_ car: Car) {
        brandLabel.text = car.brand
        brandImageView.image = car.brandImage
    }

    
}
