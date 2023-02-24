//
//  CarTableViewCell.swift
//  BackFront-TableView
//
//  Created by Alessandro Comparini on 24/02/23.
//

import UIKit

class CarTableViewCell: UITableViewCell {

    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var brandImageView: UIImageView!
    
    static let identifier: String = "CarTableViewCell"
    
    static public func nib() -> UINib {
        return UINib(nibName: CarTableViewCell.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(brand: String) {
        brandImageView.image = UIImage(named: brand)
        brandLabel.text = brand
    }

    
}
