//
//  SelectionViewController.swift
//  BackFront-NotificationCenter
//
//  Created by Alessandro Comparini on 02/03/23.
//

import UIKit

class SelectionViewController: UIViewController {

    private var selectionScreen: SelectionScreen?
    
    override func loadView() {
        super.loadView()
        selectionScreen = SelectionScreen()
        view = selectionScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
