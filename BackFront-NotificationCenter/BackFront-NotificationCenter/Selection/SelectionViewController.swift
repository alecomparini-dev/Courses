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
        configDelegates()
    }
    
    private func configDelegates() {
        selectionScreen?.delegate(delegate: self)
    }

}

//  MARK: - Extension Delegates
extension SelectionViewController: SelectionScreenDelegate {
    
    func tappedNote(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("note"), object: nil)
        navigationController?.popViewController(animated: true)
    }
    
    func tappedDeskTop(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("desktop"), object: nil)
        navigationController?.popViewController(animated: true)
    }
    
}
