//
//  UIView+Extension.swift
//  BackFront-BFNFT
//
//  Created by Alessandro Comparini on 10/03/23.
//


import UIKit

extension UIViewController {
    
    func hideKeyboard() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
}
