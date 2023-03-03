//
//  SelectionViewController.swift
//  BackFront-NotificationCenter
//
//  Created by Alessandro Comparini on 02/03/23.
//

import UIKit

protocol SelectionViewControllerDelegate: AnyObject {
    func updateNote()
    func updateDesktop()
}

class SelectionViewController: UIViewController {
    
    private weak var delegate: SelectionViewControllerDelegate?
    public func delegate(delegate: SelectionViewControllerDelegate) {
        self.delegate = delegate
    }
    
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
//        NotificationCenter.default.post(name: Notification.Name("note"), object: nil)
        delegate?.updateNote()
        navigationController?.popViewController(animated: true)
    }
    
    func tappedDeskTop(_ sender: UIButton) {
//        NotificationCenter.default.post(name: Notification.Name("desktop"), object: nil)
        delegate?.updateDesktop()
        navigationController?.popViewController(animated: true)
    }
    
}

