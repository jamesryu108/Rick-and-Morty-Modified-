//
//  EpisodeTopImageView.swift
//  Rick&Monty
//
//  Created by James Ryu on 2021-12-09.
//

import UIKit

class EpisodeTopImageView: UIImageView {
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Set up the View
    private func configure() {
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false

        self.image = UIImage(named: "rickmorty")
        
        self.addSubview(label)
        
        label.anchor(top: self.safeAreaLayoutGuide.topAnchor, verticalSpace: 0, bottom: self.safeAreaLayoutGuide.bottomAnchor, left: self.safeAreaLayoutGuide.leftAnchor, horizontalSpace: 0, right: self.safeAreaLayoutGuide.rightAnchor)
        label.alpha = 0.5
        label.textColor = .black
    }
}
