//
//  ActivityIndicator.swift
//  Rick and Morty
//
//  Created by James Ryu on 2021-12-10.
//

import UIKit

class MyActivityIndicator {
    
    /// Indicator that runs while something is loading. Then it disappears once task finishes.
    var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.color = .systemBlue
        return view
    }()
    
    func startAnimating() {
        
    }
    
    func stopAnimating() {
        
    }
}


