//
//  CarScreen.swift
//  BackFront-TableView-PassingObject
//
//  Created by Alessandro Comparini on 24/02/23.
//

import UIKit

class CarScreen: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let listCar: [Car] = [
        Car(brand: "Bentley", brandImage: UIImage(named: "Bentley") ?? UIImage()),
        Car(brand: "BMW", brandImage: UIImage(named: "BMW") ?? UIImage()),
        Car(brand: "Ford", brandImage: UIImage(named: "Ford") ?? UIImage()),
        Car(brand: "Honda", brandImage: UIImage(named: "Honda") ?? UIImage()),
        Car(brand: "Hyundai", brandImage: UIImage(named: "Hyundai") ?? UIImage()),
        Car(brand: "Mercedes-Benz", brandImage: UIImage(named: "Mercedes-Benz") ?? UIImage()),
        Car(brand: "Nissan", brandImage: UIImage(named: "Nissan") ?? UIImage()),
        Car(brand: "Subaru", brandImage: UIImage(named: "Subaru") ?? UIImage()),
        Car(brand: "Toyota", brandImage: UIImage(named: "Toyota") ?? UIImage()),
        Car(brand: "Volskwagen", brandImage: UIImage(named: "Volskwagen") ?? UIImage())
    ]
    
    
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
        
        cell?.setupCell(listCar[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(listCar[indexPath.row].brand)
    }
    
    
    
}
