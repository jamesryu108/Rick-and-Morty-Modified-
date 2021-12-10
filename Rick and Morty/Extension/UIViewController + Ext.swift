//
//  UIViewController.swift
//  Rick&Monty
//
//  Created by James Ryu on 2021-12-08.
//

import UIKit

extension UIViewController {
    
    func AlertControllerPresenter(title: String, message: String) -> UIAlertController {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Okay", style: .default)
        
            alertController.addAction(action)
        
        return alertController
    }
}
