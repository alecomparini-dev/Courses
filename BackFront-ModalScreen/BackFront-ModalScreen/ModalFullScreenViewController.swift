//
//  ModalFullScreenViewController.swift
//  BackFront-ModalScreen
//
//  Created by Alessandro Comparini on 23/02/23.
//

import UIKit

class ModalFullScreenViewController: UIViewController {

    
    @IBOutlet weak var closeFullScreenButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func tappedCloseFullScreenButton(_ sender: UIButton) {
        
        self.dismiss(animated: true)
        
    }
    

}
