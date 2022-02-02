//
//  Anchor.swift
//  Rick&Monty
//
//  Created by James Ryu on 2021-12-08.
//

import UIKit

extension UIView {
    
    func anchor(             top: NSLayoutYAxisAnchor? = nil,
                   verticalSpace: CGFloat?             = nil,
                          bottom: NSLayoutYAxisAnchor? = nil,
                            left: NSLayoutXAxisAnchor? = nil,
                 horizontalSpace: CGFloat?             = nil,
                           right: NSLayoutXAxisAnchor? = nil,
                           width: CGFloat?             = nil,
                          height: CGFloat?             = nil,
                         centerX: NSLayoutXAxisAnchor? = nil,
                         centerY: NSLayoutYAxisAnchor? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: verticalSpace!).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -verticalSpace!).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -horizontalSpace!).isActive = true
        }
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: horizontalSpace!).isActive = true
        }
        
        if let width = width {
            
            if width != 0 {
                widthAnchor.constraint(equalToConstant: width).isActive = true
            }
        }
        
        if let height = height {
            
            if height != 0 {
                heightAnchor.constraint(equalToConstant: height).isActive = true
            }
        }
        
        if let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        
        if let centerY = centerY {
            centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
    }
}
