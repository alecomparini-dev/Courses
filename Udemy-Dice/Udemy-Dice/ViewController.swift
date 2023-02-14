//
//  ViewController.swift
//  Udemy-Dice
//
//  Created by Alessandro Comparini on 13/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dice1: UIImageView!
    @IBOutlet weak var dice2: UIImageView!
    
    @IBAction func playButton(_ sender: UIButton) {
        let arrayDices = [UIImage(imageLiteralResourceName: "DiceOne"),
                          UIImage(imageLiteralResourceName: "DiceTwo"),
                          UIImage(imageLiteralResourceName: "DiceThree"),
                          UIImage(imageLiteralResourceName: "DiceFour"),
                          UIImage(imageLiteralResourceName: "DiceFive"),
                          UIImage(imageLiteralResourceName: "DiceSix")]
        
        dice1.image = arrayDices.randomElement()
        dice2.image = arrayDices.randomElement()
        
    }
}
