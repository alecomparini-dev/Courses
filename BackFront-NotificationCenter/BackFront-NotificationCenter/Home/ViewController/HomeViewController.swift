//
//  HomeViewController.swift
//  BackFront-NotificationCenter
//
//  Created by Alessandro Comparini on 02/03/23.
//

import UIKit

class HomeViewController: UIViewController {

    private var homeScreen: HomeScreen?
    private var selectionVC: SelectionViewController?
        
    override func loadView() {
        super.loadView()
        self.homeScreen = HomeScreen()
        view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configHomeScreenDelegate()
        configSelectionVCDelegate()
    }
    
    private func configHomeScreenDelegate() {
        homeScreen?.delegate(delegate: self)
    }
    
//    func configObserver() {
//        NotificationCenter.default.addObserver(self, selector: #selector(updateNote), name: Notification.Name("note"), object: nil)
//
//        NotificationCenter.default.addObserver(self, selector: #selector(updateDesktop), name: Notification.Name("desktop"), object: nil)
//    }
    
    func configSelectionVCDelegate() {
        selectionVC = SelectionViewController()
        selectionVC?.delegate(delegate: self)
    }
    
//    @objc func updateNote(notification: Notification) {
//        
//    }
//    
//    @objc func updateDesktop(notification: Notification) {
//        
//    }

}


//  MARK: - EXTENSION - HOME SCREEN DELEGATE

extension HomeViewController: HomeScreenDeletage {
    
    func tappedClickHere() {
//        present(selectionVC, animated: true)
        navigationController?.pushViewController(self.selectionVC ?? SelectionViewController(), animated: true)
    }
}


extension HomeViewController: SelectionViewControllerDelegate {
    
    func updateNote() {
        homeScreen?.appleImageView.image = UIImage(named: "macbook_pro")
        homeScreen?.backgroundColor = .red
    }
    
    func updateDesktop() {
        homeScreen?.appleImageView.image = UIImage(named: "imac_pro")
        homeScreen?.backgroundColor = .cyan
    }
    
    
    
}
