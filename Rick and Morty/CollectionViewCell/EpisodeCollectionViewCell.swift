//
//  EpisodeCollectionViewCell.swift
//  Rick&Monty
//
//  Created by James Ryu on 2021-12-08.
//

import UIKit

class EpisodeCollectionViewCell: UICollectionViewCell {

    /// Comes with 'static' keyword so that the reuseIdentifier variable can become type variable and be able to access it somewhere else. (e.g. ViewController)
    static let reuseIdentifier = "episode"
    
    // UIView object that has a gradient background
    let gradientView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray6
        return view
    }()
    
    /// Label that shows Season/Episode number
    let episodeTitleLabel = AttributedTitleLabel(fontSize: 25)
    
    override init(frame: CGRect) {
        
        super.init(frame:frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Adding the data
    func addData(data: Results) {
        let originalString = "\(data.episode)"
        let formattedString = NSMutableAttributedString(string: originalString)
        formattedString.addAttribute(.foregroundColor, value: UIColor.label, range: NSRange(location: 0, length: originalString.count))
        episodeTitleLabel.attributedText = formattedString
    }
    
    /// A function that sets up the cell. It will add the gradientView and the label.
    func setupTheCell() {
        
        backgroundColor = .systemGray6
        
        contentView.addSubview(gradientView)

        gradientView.anchor(top: contentView.topAnchor, verticalSpace: 0, left: contentView.leftAnchor, horizontalSpace: 0, right: contentView.rightAnchor, height: contentView.frame.width, centerX: contentView.centerXAnchor)
                        
        gradientView.addSubview(episodeTitleLabel)
        
        episodeTitleLabel.anchor(top: gradientView.topAnchor, verticalSpace: 0, bottom: gradientView.bottomAnchor, left: gradientView.leftAnchor, horizontalSpace: 0, right: gradientView.rightAnchor)
    }
}
