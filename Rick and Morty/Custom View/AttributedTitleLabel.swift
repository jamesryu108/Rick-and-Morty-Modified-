//
//  AttributedTitleLabel.swift
//  Rick&Monty
//
//  Created by James Ryu on 2021-12-09.
//

import UIKit

class AttributedTitleLabel: UILabel{

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(fontSize: CGFloat) {
        self.init(frame: .zero)
        font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
    }
      
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        numberOfLines = 0
        textAlignment = .center
        textColor = .white
    }
}
