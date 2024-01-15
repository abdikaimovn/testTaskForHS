//
//  AlertManager.swift
//  testTask
//
//  Created by Нурдаулет on 16.01.2024.
//

import UIKit

class AlertManager {
    static func showAlert(in viewController: UIViewController, title: String?, message: String?, actions: [UIAlertAction] = []) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if actions.isEmpty {
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
        } else {
            actions.forEach { alert.addAction($0) }
        }
        
        DispatchQueue.main.async {
            viewController.present(alert, animated: true, completion: nil)
        }
    }
}
