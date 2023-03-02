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
    }
    
    private func configHomeScreenDelegate() {
        homeScreen?.delegate(delegate: self)
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
