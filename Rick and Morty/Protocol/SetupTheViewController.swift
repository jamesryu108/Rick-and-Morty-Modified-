//
//  SetupTheViewController.swift
//  Rick&Monty
//
//  Created by James Ryu on 2021-12-08.
//

import Foundation

/// addRightBarItem is optional. Few functions that must be adopted for all UIViewController.
@objc protocol SetupTheViewController {
    
    func setupTheViewController()
    @objc optional func addRightBarItem()
}
