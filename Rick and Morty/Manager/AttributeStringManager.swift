//
//  AttributeStringManager.swift
//  Rick and Morty
//
//  Created by James Ryu on 2021-12-10.
//

import UIKit

class AttributeStringManager {
    
    /// Output strings
    static func outputAttributedString(text: String, episodeName: String) -> NSMutableAttributedString {
     
        let firstAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 20, weight: .bold), .foregroundColor: UIColor.label]
        
        let secondAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .regular), .foregroundColor: UIColor.label]

        let firstString = NSMutableAttributedString(string: text, attributes: firstAttributes)
        let secondString = NSAttributedString(string: episodeName, attributes: secondAttributes)
        
        firstString.append(secondString)
        
        return firstString
    }
    
}
