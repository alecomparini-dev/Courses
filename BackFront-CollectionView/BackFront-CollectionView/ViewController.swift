//
//  ViewController.swift
//  BackFront-CollectionView
//
//  Created by Alessandro Comparini on 25/02/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func tappedOpenCarScreenButton(_ sender: UIButton) {
        let carScreen = UIStoryboard(name: CarScreen.identifier, bundle:nil).instantiateViewController(withIdentifier: CarScreen.identifier) as? CarScreen
        
        self.navigationController?.pushViewController(carScreen ?? UIViewController(), animated: true)
    }
    

}

