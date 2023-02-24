//
//  ViewController.swift
//  BackFront-TableView-PassingObject
//
//  Created by Alessandro Comparini on 24/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var openCarScreen: UIButton!
    
    let carScreen = UIStoryboard(name: "CarScreen", bundle: nil).instantiateViewController(withIdentifier: "CarScreen") as? CarScreen
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func tappedOpenCarScreenButton(_ sender: UIButton) {
        self.navigationController?.pushViewController(carScreen ?? UIViewController(), animated: true)
    }
}

