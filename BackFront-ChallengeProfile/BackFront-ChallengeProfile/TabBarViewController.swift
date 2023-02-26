//
//  ViewController.swift
//  BackFront-ChallengeProfile
//
//  Created by Alessandro Comparini on 26/02/23.
//

import UIKit

class TabBarViewController: UITabBarController {
    let black = UIColor.black.cgColor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTabBarController()
        
        
    }
    
    func configTabBarController() {
        setImages()
        setTitles()
        setAppearance()
    }
    
    func setImages() {
        tabBar.items?[0].image = UIImage(systemName: "person.fill")
        tabBar.items?[1].image = UIImage(systemName: "bitcoinsign.circle.fill")
        tabBar.items?[2].image = UIImage(systemName: "trash")
    }
    
    func setTitles() {
        tabBar.items?[0].title = "Tela 01"
        tabBar.items?[1].title = "Tela 02"
        tabBar.items?[2].title = "Tela 03"
    }
    
    func setAppearance() {
        tabBar.layer.backgroundColor = UIColor.white.cgColor
        tabBar.layer.borderWidth = 0.2
        tabBar.layer.borderColor = black
        setShadow()
        
//        tabBar.inputViewController?.additionalSafeAreaInsets.bottom = 80
    
    }
    
    func setShadow() {
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowColor = black
        tabBar.layer.shadowOpacity = 0.3
    }
    

}


