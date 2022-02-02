//
//  EpisodeLabel.swift
//  Rick&Monty
//
//  Created by James Ryu on 2021-12-09.
//

import UIKit

class EpisodeLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implementef")
    }
    
    /// Set up the label settings such as font size, text color and etc.
    private func configure() {
        textColor = .white
        font = UIFont.systemFont(ofSize: 20, weight: .bold)
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .center
        numberOfLines = 0
    }
}
