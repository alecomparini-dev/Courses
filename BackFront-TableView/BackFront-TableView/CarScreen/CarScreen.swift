//
//  CarScreen.swift
//  BackFront-TableView
//
//  Created by Alessandro Comparini on 24/02/23.
//

import UIKit

class CarScreen: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let listCar: [String] = ["Bentley","BMW","Mercedes-Benz","Subaru","Hyundai","Volskwagen","Toyota","Ford","Honda", "Nissan"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()

    }
    
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CarTableViewCell.nib(), forCellReuseIdentifier: CarTableViewCell.identifier)
    }

}

extension CarScreen: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CarTableViewCell.identifier, for: indexPath) as? CarTableViewCell
        
        cell?.setupCell(brand: listCar[indexPath.row] )
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(listCar[indexPath.row])
    }
    
    
}
