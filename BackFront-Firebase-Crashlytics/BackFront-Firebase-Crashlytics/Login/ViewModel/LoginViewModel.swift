//
//  LoginViewModel.swift
//  BackFront-Firebase-Crashlytics
//
//  Created by Alessandro Comparini on 07/03/23.
//

import UIKit
import FirebaseAuth

class LoginViewModel {

    public func login(email: String, password: String, completion: @escaping (_ errorDescription: String?) -> Void) {
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if error != nil {
                completion(error?.localizedDescription ?? "")
                return
            }
            completion(nil)
        }
        
    }
    
}
