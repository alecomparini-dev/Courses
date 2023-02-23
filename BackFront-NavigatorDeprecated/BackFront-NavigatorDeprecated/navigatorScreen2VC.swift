//
//  navigatorScreen2VC.swift
//  BackFront-NavigatorDeprecated
//
//  Created by Alessandro Comparini on 23/02/23.
//

import UIKit

class navigatorScreen2VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func pressedCloseScreenButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func pressedReturnScreen1Button(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)        
    }
    

}
