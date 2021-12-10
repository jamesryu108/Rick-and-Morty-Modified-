//
//  EpisodeCastCollectionViewCell.swift
//  Rick&Monty
//
//  Created by James Ryu on 2021-12-09.
//

import UIKit

class EpisodeCastCollectionViewCell: UICollectionViewCell {
        
    static let reuseIdentifier = "cast"

    let characterImage: UIImageView = {
        
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        
        return img
    }()
    
    let characterName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Test"
        label.textAlignment = .center
        label.backgroundColor = .systemPink
        return label
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame:frame)
        
        self.contentView.addSubview(characterImage)
        
        characterImage.anchor(top: self.contentView.topAnchor, verticalSpace: 0, left: self.contentView.leftAnchor, horizontalSpace: 0, right: self.contentView.rightAnchor, height: self.contentView.frame.width)
        
        self.contentView.addSubview(characterName)
        
        characterName.anchor(top: characterImage.bottomAnchor, verticalSpace: 0, bottom: self.contentView.bottomAnchor, left: self.contentView.leftAnchor, horizontalSpace: 0, right: self.contentView.rightAnchor, height: 32)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
