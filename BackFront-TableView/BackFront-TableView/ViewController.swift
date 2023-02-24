//
//  ViewController.swift
//  BackFront-TableView
//
//  Created by Alessandro Comparini on 24/02/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func tappedSeeCarButton(_ sender: UIButton) {
        
        let carScreen: CarScreen? = UIStoryboard(name: "CarScreen", bundle: nil)
            .instantiateViewController(withIdentifier: "CarScreen") as? CarScreen
        
        self.navigationController?.pushViewController(carScreen ?? UIViewController(), animated: true)
        
        
    }
}

