//
//  ContactTableViewCell.swift
//  BackFront-ChallengeProfile
//
//  Created by Alessandro Comparini on 26/02/23.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    @IBOutlet weak var contactProfileImageView: UIImageView!
    @IBOutlet weak var contactLabel: UILabel!
    
    static let identificar: String = "ContactTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: self.identificar, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        configContactProfileImage()
    }
    
    func setuCell(contact: Contact ) {
        contactProfileImageView.image = contact.imageProfile
        contactLabel.text = contact.name
    }

    func configContactProfileImage() {
        contactProfileImageView.roundedImage(borderWidth: 1.0, borderColor: UIColor.white.cgColor)
    }
    
}

