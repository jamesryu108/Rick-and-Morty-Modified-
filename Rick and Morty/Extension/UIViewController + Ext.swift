//
//  UIViewController.swift
//  Rick&Monty
//
//  Created by James Ryu on 2021-12-08.
//

import UIKit

extension UIViewController {
    
    func alertControllerPresenter(title: String, message: String) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(.init(title: "Okay", style: .default))
        return alertController
    }
}
