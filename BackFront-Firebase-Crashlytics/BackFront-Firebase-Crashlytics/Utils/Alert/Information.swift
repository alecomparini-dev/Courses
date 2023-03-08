//
//  Information.swift
//  BackFront-Firebase-Crashlytics
//
//  Created by Alessandro Comparini on 08/03/23.
//

import UIKit

class Information: AlertProtocol {

    func createAlert(_ title: String, _ message: String) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(ok)
        return alertController
    }
    
    
}
