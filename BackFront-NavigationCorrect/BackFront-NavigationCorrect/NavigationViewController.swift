//
//  NavigationViewController.swift
//  BackFront-NavigationCorrect
//
//  Created by Alessandro Comparini on 23/02/23.
//

import UIKit

class NavigationViewController: UIViewController {

    @IBOutlet weak var textFieldReceivedLabel: UILabel!
    
    let textFieldReceived: String
    
    init?(coder: NSCoder, textFieldReceived: String) {
        self.textFieldReceived = textFieldReceived
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldReceivedLabel.text = self.textFieldReceived
    }
    

    
    
}
