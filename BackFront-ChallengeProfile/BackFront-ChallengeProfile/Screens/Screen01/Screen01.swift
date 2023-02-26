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
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        configAlert()
        
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
    
    
    func configAlert() {
        let alert: UIAlertController = UIAlertController(title: "Choose source", message:"", preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { UIAlertAction in
            self.openCamera()
        }
        let gallaryAction = UIAlertAction(title: "Gallary", style: .default) { UIAlertAction in
            self.openGallary()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(cameraAction)
        alert.addAction(gallaryAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true,completion: nil)
            return
        }
        alertNotCamera()
    }
    
    func openGallary() {
        print("open gallary")
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true,completion: nil)
        }
    }
    
    func alertNotCamera() {
        let alertWarning = UIAlertController(title: "Warning", message: "You dont't have camera", preferredStyle: .alert)
        alertWarning.addAction(UIAlertAction(title: "OK", style: .cancel,handler: nil))
        self.present(alertWarning, animated: true)
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
