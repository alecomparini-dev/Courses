//
//  CarScreen.swift
//  BackFront-CollectionView
//
//  Created by Alessandro Comparini on 25/02/23.
//

import UIKit

class CarScreen: UIViewController {

    static let identifier = "CarScreen"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CarCellTableViewCell.nib(), forCellReuseIdentifier: CarCellTableViewCell.identifier)
    }

}

extension CarScreen: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CarCellTableViewCell.identifier, for: indexPath) as? CarCellTableViewCell
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 430
    }
    
    
}
