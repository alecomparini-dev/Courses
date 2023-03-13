//
//  LoginViewModel.swift
//  BackFront-BFNFT
//
//  Created by Alessandro Comparini on 10/03/23.
//

import UIKit

class LoginViewModel {
    
    func validateEmail(_ text: String) -> Bool {
        if validateIsEmpty(text) { return false }
        return text.isValid(validType: .email)
    }
    
    func validatePassword(_ text: String) -> Bool {
        if validateIsEmpty(text) { return false }
        return text.isValid(validType: .password)
    }
    
    func validateIsEmpty(_ text: String) -> Bool {
        return text.isEmpty
    }
    
    
}
