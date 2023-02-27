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
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var contactNameTextField: UITextField!
    
    lazy var contacts: [Contact] = [Contact(name: "Alessandro", imageProfile: profileImageView.image ?? UIImage())]
    
    enum ChosenUploadEnum: String, CaseIterable {case profile = "profile"; case contact = "contact"}
    var chosenUpload: ChosenUploadEnum?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configScreen01()
    }
    
    @IBAction func tappedEditProfileButton(_ sender: UIButton) {
        uploadImage(ChosenUploadEnum.profile)
    }
    
    @IBAction func tappedAddContactButton(_ sender: UIButton) {
//        validateAddContact()
        uploadImage(ChosenUploadEnum.contact)
    }
    
    func configScreen01() {
        view.backgroundColor = .white
        configScreenProfile()
        configTableView()
    }
    
    func configScreenProfile() {
        configProfile()
        configEditProfileButton()
        configTapGestureImageView()
    }
    
    func configTapGestureImageView() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(Screen01.tappedMe))
        profileImageView.addGestureRecognizer(tapGestureRecognizer)
        profileImageView.isUserInteractionEnabled = true
    }
    
    @objc func tappedMe() {
        uploadImage(ChosenUploadEnum.profile)
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
    
    func uploadImage(_ chosenUploadImage: ChosenUploadEnum) {
        self.chosenUpload = chosenUploadImage
        
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
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = false
            imagePicker.delegate = self
            self.present(imagePicker, animated: true, completion: nil)
            return
        }
        alertNotCamera()
    }
    
    func openGallary() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            imagePicker.delegate = self
            self.present(imagePicker, animated: true,completion: nil)
        }
    }
    
    func alertNotCamera() {
        let alertWarning = UIAlertController(title: "Warning", message: "You dont't have camera", preferredStyle: .alert)
        alertWarning.addAction(UIAlertAction(title: "OK", style: .cancel,handler: nil))
        self.present(alertWarning, animated: true)
    }
    
 
    
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ContactTableViewCell.nib(), forCellReuseIdentifier: ContactTableViewCell.identificar)
    }
    

}

// MARK:- extension tableView
extension Screen01: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactTableViewCell.identificar, for: indexPath) as? ContactTableViewCell
        
        cell?.setuCell(contact: contacts[indexPath.row] )
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
}


// MARK:- extension view

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



//MARK:- extension Image Picker

extension Screen01: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
//
    
    func imagePickerController(_ picker: UIImagePickerController,  didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        guard let image = info[.originalImage] as? UIImage else { return }
        
        if chosenUpload == ChosenUploadEnum.profile {
            profileImageView.image = image
            profileImageView.roundedImage(borderWidth: 7.0, borderColor: UIColor.white.cgColor)
        }
        
        if chosenUpload == ChosenUploadEnum.contact {
            contacts.append(Contact(name: contactNameTextField.text ?? "" , imageProfile: image))
            tableView.reloadData()
            contactNameTextField.text = ""
        }
              
        picker.dismiss(animated: true, completion: nil)
        
    }
    
}
