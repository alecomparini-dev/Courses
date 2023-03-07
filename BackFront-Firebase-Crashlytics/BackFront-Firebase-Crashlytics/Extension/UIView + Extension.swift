//
//  UIView + Extesion.swift
//  BackFront-Posts-Stories
//
//  Created by Alessandro Comparini on 06/03/23.
//

import UIKit
import Foundation

extension UIView {
    
    func setCardShadow() {
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 8
        layer.shouldRasterize = true
        layer.masksToBounds = false
        layer.rasterizationScale = UIScreen.main.scale
    }
    
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.topAnchor),
            leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor),
            bottomAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
