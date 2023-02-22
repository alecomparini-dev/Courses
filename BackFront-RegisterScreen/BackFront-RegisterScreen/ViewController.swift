//
//  ViewController.swift
//  BackFront-RegisterScreen
//
//  Created by Alessandro Comparini on 22/02/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var tappedRegisterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.isSecureTextEntry = true
        setKeyBoardType()
        setTextFieldDelegate()
        configureRegisterButton()
    }
    
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
        let response: String = """
        Name: \(nameTextField.text ?? "")
        E-mail: \(emailTextField.text ?? "")
        password: \(passwordTextField.text ?? "")
        """
        print(response)
    }
    

    func configureRegisterButton() {
        tappedRegisterButton.isEnabled = false
        tappedRegisterButton.setTitleColor(.white.withAlphaComponent(0.4), for: UIControl.State.disabled)
        tappedRegisterButton.setTitleColor(.white, for: UIControl.State.normal)
    }
    
    
    func setTextFieldDelegate() {
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func setKeyBoardType() {
        self.passwordTextField.keyboardType = .default
        self.nameTextField.keyboardType = .default
        self.emailTextField.keyboardType = .emailAddress
    }
    
    
    func isAllFilledTextFields() -> Bool {
        return nameTextField.text != "" && emailTextField.text != "" && passwordTextField.text != ""
    }
    
    func enableRegisterButton() {
        tappedRegisterButton.isEnabled = isAllFilledTextFields()
    }
    
    


}



extension ViewController: UITextFieldDelegate {
        
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.myGreenColor.cgColor
        textField.layer.borderWidth = 0.8
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        enableRegisterButton()
        textField.layer.borderWidth = 0
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}

extension UIColor {
    static let myGreenColor = UIColor(red: 0.00, green: 0.42, blue: 0.46, alpha: 1.00)
}


