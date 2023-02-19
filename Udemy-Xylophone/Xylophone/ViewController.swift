//
//  ViewController.swift
//  Xylophone
//
//  Created by Alessandro Comparini on 16/02/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let title = sender.titleLabel!.text!
        playSound(soundName: title)
        
        //Reduces the sender's (the button that got pressed) opacity to half.
        sender.alpha = 0.5
        
        //Code should execute after 0.2 second delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
        }
        
    }
    
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = AVPlayer.init(url: url!)
        player.play()
    }
    
}

