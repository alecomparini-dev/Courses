//
//  RegisterVC.swift
//  BackFront-BFNFT
//
//  Created by Alessandro Comparini on 10/03/23.
//

import UIKit

class RegisterVC: UIViewController {

    private var screenRegister: RegisterScreen?
    
    override func loadView() {
        self.screenRegister = RegisterScreen()
        view = screenRegister
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
