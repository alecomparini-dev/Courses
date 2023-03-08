//
//  RegisterViewModel.swift
//  BackFront-Firebase-Crashlytics
//
//  Created by Alessandro Comparini on 07/03/23.
//

import UIKit
import FirebaseAuth

class RegisterViewModel {
    
    public func createUser(email: String, password: String, completion: @escaping (_ errorDescription: String?) -> Void) {
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error != nil {
                print("erro ao cadastrar")
                completion(error?.localizedDescription ?? "")
                return
            }
            completion(nil)
            print("sucesso ao cadastrar")
        }
        
    }
    
}
