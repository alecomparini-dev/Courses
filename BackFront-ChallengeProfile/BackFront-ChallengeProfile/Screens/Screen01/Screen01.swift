//
//  Screen01.swift
//  BackFront-ChallengeProfile
//
//  Created by Alessandro Comparini on 26/02/23.
//

import UIKit

class Screen01: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var editProfileButton: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configScreen01()
    }
    
    @IBAction func tappedEditProfileButton(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    
    func configScreen01() {
        view.backgroundColor = .white
        configScreenProfile()
    }
    
    func configScreenProfile() {
        configProfile()
        configEditProfileButton()
    }
    
    
    func configProfile() {
        profileImageView.image = UIImage(systemName: "person.circle.fill")
        profileImageView.backgroundColor = .white
        profileImageView.tintColor = UIColor.systemGray2
        profileImageView.roundedImage(borderWidth: 1.0, borderColor: UIColor.white.cgColor)
    }
    
    func configEditProfileButton() {
        editProfileButton.setImage(UIImage(systemName: "square.and.arrow.up.fill"), for: .normal)
        editProfileButton.tintColor = .white
        editProfileButton.setTitle(" Image", for: .normal)
        editProfileButton.titleLabel?.font = .systemFont(ofSize: 14)
    }
    
    

}

extension UIImageView {
    func roundedImage(borderWidth bdWidth: CGFloat = 0, borderColor bdColor: CGColor = UIColor.white.cgColor) {
        self.contentMode = .scaleAspectFill
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
        self.layer.masksToBounds = true
        self.layer.borderWidth = bdWidth
        self.layer.borderColor = bdColor
    }
    
}

extension Screen01: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileImageView.image = image
        }
        
    }
    
}
