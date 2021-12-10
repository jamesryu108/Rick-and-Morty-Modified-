//
//  StackManager.swift
//  Rick&Monty
//
//  Created by James Ryu on 2021-12-09.
//

import UIKit

/// Manages the creation of UIStackView. Very flexible because it takes in StackSettings data type to decide how UIStackView will look and behave.
struct StackManager {
    
    /// Stack-making functions that outputs UIStackView object based on two parameters such as [UIView] and StackSettings object.
    /// - Parameters:
    ///   - views: Array of UIView objects. All UIView objects here will go into the stack.
    ///   - settings: StackSettings type will set the settings of the UIStackView
    func stackMaker(views: [UIView], settings: StackSettings) -> UIStackView {
        
        let vStackMaker: UIStackView = {
                let stack = UIStackView()
                stack.translatesAutoresizingMaskIntoConstraints = false
                return stack
            }()
        
        for view in views {
            vStackMaker.addArrangedSubview(view)
        }
        
        vStackMaker.alignment = settings.alignment
        vStackMaker.axis = settings.axis
        vStackMaker.distribution = settings.distribution
        
        return vStackMaker
    }
}
