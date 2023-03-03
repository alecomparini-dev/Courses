//
//  HomeViewController.swift
//  BackFront-NotificationCenter
//
//  Created by Alessandro Comparini on 02/03/23.
//

import UIKit

class HomeViewController: UIViewController {

    private var homeScreen: HomeScreen?

    override func loadView() {
        super.loadView()
        self.homeScreen = HomeScreen()
        view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configHomeScreenDelegate()
        configObserver()
    }
    
    private func configHomeScreenDelegate() {
        homeScreen?.delegate(delegate: self)
    }
    
    func configObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateNote), name: Notification.Name("note"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateDesktop), name: Notification.Name("desktop"), object: nil)
    }
    
    @objc func updateNote(notification: Notification) {
        homeScreen?.appleImageView.image = UIImage(named: "macbook_pro")
        homeScreen?.backgroundColor = .red
    }
    
    @objc func updateDesktop(notification: Notification) {
        homeScreen?.appleImageView.image = UIImage(named: "imac_pro")
        homeScreen?.backgroundColor = .cyan
    }

}


//  MARK: - EXTENSION - HOME SCREEN DELEGATE

extension HomeViewController: HomeScreenDeletage {
    func tappedClickHere() {
        let selectionVC = SelectionViewController()
//        present(selectionVC, animated: true)
        navigationController?.pushViewController(selectionVC, animated: true)
    }
}
