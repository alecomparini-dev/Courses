//
//  Alert.swift
//  BackFront-1oViewCode
//
//  Created by Alessandro Comparini on 01/03/23.
//

import UIKit

enum Choose {
    case camera
    case photoGallary
    case cancel
}

class Alert: NSObject {
    
    private let controller: UIViewController?
    
    init(controller: UIViewController) {
        self.controller = controller
    }

    func chooseImage (completion: @escaping (_ option: Choose) -> Void) {
        
        let alertController: UIAlertController = UIAlertController(title: "Choose one of options below", message: "", preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default)  { action in
            completion(.camera)
        }
        
        let gallaryAction = UIAlertAction(title: "Photo Gallary", style: .default) { action in
            completion(.photoGallary)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) {action in
            completion(.cancel)
        }
        
        alertController.addAction(cameraAction)
        alertController.addAction(gallaryAction)
        alertController.addAction(cancelAction)
        
        controller?.present(alertController, animated: true)
        
    }
    
}
