//
//  HomeViewController.swift
//  BackFront-Posts-Stories
//
//  Created by Alessandro Comparini on 06/03/23.
//

import UIKit

class HomeViewController: UIViewController {

    private let home: HomeScreen = HomeScreen()
    
    override func loadView() {
        super.loadView()
        view = home
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        home.backgroundColor = .red
    }
    


}
