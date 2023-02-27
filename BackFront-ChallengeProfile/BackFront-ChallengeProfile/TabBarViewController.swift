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
        setColorSelectedItem()
    }
    
    func setImages() {
        tabBar.items?[0].image = UIImage(systemName: "person.fill.badge.plus")
        tabBar.items?[1].image = UIImage(systemName: "bitcoinsign.circle.fill")
        tabBar.items?[2].image = UIImage(systemName: "trash")
    }
    
    func setTitles() {
        tabBar.items?[0].title = "Add Contact"
        tabBar.items?[1].title = "Tela 02"
        tabBar.items?[2].title = "Tela 03"
    }

    func setColorSelectedItem() {
        UITabBar.appearance().tintColor = UIColor.white
        UITabBar.appearance().unselectedItemTintColor = UIColor.systemGray2
    }
    
    func setAppearance() {
        tabBar.layer.backgroundColor = UIColor(red: 30/255, green: 94/255, blue: 101/255, alpha: 1).cgColor
        tabBar.layer.borderWidth = 0.2
        tabBar.layer.borderColor = black
        setShadow()
        
//        tabBar.inputViewController?.additionalSafeAreaInsets.bottom = 80
    
    }
    
    func setShadow() {
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowColor = black
        tabBar.layer.shadowOpacity = 0.5
    }
    

}


