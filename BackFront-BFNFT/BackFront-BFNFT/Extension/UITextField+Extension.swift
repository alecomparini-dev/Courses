//
//  TextField+Extension.swift
//  BackFront-BFNFT
//
//  Created by Alessandro Comparini on 10/03/23.
//

import UIKit

extension UITextField {
    
    func configAccessibility(label: String, hint: String? = nil, trait: UIAccessibilityTraits? = nil) {
        accessibilityLabel = label
        accessibilityHint = hint
        if let trait = trait {
            accessibilityTraits = trait
        }
    }
    
}
