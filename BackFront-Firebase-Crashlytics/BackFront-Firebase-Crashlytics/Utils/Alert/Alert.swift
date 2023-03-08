//
//  Alert.swift
//  BackFront-Firebase-Crashlytics
//
//  Created by Alessandro Comparini on 08/03/23.
//

//import Foundation
import UIKit

protocol AlertProtocol: AnyObject {
    func createAlert(_ title: String, _ message: String ) -> UIAlertController
}

class Alert {
    private var delegate: AlertProtocol?
    
    private let title: String
    private let message: String
    private let controller: UIViewController
    
    init(controller ctrl: UIViewController, title tl:String, message msg: String) {
        self.controller = ctrl
        self.title = tl
        self.message = msg
    }
    
    public func warning() {
        self.delegate = Information()
        let alertControl: UIAlertController = self.delegate?.createAlert(self.title, self.message) ?? UIAlertController()
        controller.present(alertControl, animated: true)
    }
    
 
}
