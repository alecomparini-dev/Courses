//
//  ViewController.swift
//  BackFront-NavigationCorrect
//
//  Created by Alessandro Comparini on 23/02/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var sendTextTextField: UITextField!
    
    let modalViewController: ModalViewController? = UIStoryboard(name: "ModalStoryboard", bundle: nil)
        .instantiateViewController(withIdentifier: "ModalStoryboard") as? ModalViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tappedOpenModalScreenButton(_ sender: UIButton) {
        
//        modalViewController.modalPresentationStyle = .fullScreen
        self.present(modalViewController ?? UIViewController() , animated: true)
        
    }
    
    @IBAction func openNavigationButton(_ sender: UIButton) {
        self.navigationController?.pushViewController(modalViewController ?? UIViewController(), animated: true)
    }
    
    
    @IBAction func tappedNavigationCorrectButton(_ sender: UIButton) {
        let navigationViewController: NavigationViewController? = UIStoryboard(name: "NavigationStoryboard", bundle: nil)
            .instantiateViewController(identifier: "NavigationStoryboard") { coder in
                return NavigationViewController(coder: coder, textFieldReceived: self.sendTextTextField.text ?? "")
            }
        
        
        self.navigationController?.pushViewController(navigationViewController ?? UIViewController(), animated: true)
    }
    
}
