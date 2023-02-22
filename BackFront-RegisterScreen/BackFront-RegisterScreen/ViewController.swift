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
    @IBOutlet weak var registerProgressView: UIProgressView!
    
    var filledTextFieldList: [String] = []
    var textFieldList: [UITextField] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.isSecureTextEntry = true
        setKeyBoardType()
        setTextFieldDelegate()
        configureRegisterButton()
        configureRegisterProgressView()
        textFieldList = [nameTextField, emailTextField, passwordTextField]
        updateRegisterProgressView()
    }
    
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
        let response: String = """
          Name: \(nameTextField.text ?? "")
          E-mail: \(emailTextField.text ?? "")
          password: \(passwordTextField.text ?? "")
          filledTextFieldsList: \(filledTextFieldList)
        """
        print(response)
    }
    
    func configureRegisterProgressView() {
        registerProgressView.tintColor = UIColor.green.withAlphaComponent(0.6)
        registerProgressView.trackTintColor = UIColor.myGreenColor.withAlphaComponent(0.4)
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
        filledTextFieldList.removeAll()
        for textField in textFieldList {
            if (!textField.text!.isEmpty) {
                filledTextFieldList.append(textField.text!)
            }
        }
        
        return textFieldList.count == filledTextFieldList.count
    }
    
    func enableRegisterButton() {
        tappedRegisterButton.isEnabled = isAllFilledTextFields()
    }
    
    func updateRegisterProgressView() {
        let totalParts = Progress(totalUnitCount: Int64(textFieldList.count))
        totalParts.completedUnitCount = Int64(filledTextFieldList.count)
        registerProgressView.setProgress(Float(totalParts.fractionCompleted), animated: true)
    }
    
    


}



extension ViewController: UITextFieldDelegate {
        
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.myGreenColor.cgColor
        textField.layer.borderWidth = 0.8
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        enableRegisterButton()
        updateRegisterProgressView()
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


