//
//  AttributeStringManager.swift
//  Rick and Morty
//
//  Created by James Ryu on 2021-12-10.
//

import UIKit

class AttributeStringManager {
    /// Takes in title and subtitle. Give bold attribute for title and regular attribute for subtitle.
    /// - Parameters:
    ///   - text: title string that you will give bold font to.
    ///   - episodeName: subtitle (episodeName) string that you will give regular font to.
    static func outputAttributedString(text: String, episodeName: String) -> NSMutableAttributedString {
        
        let firstAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 20, weight: .bold), .foregroundColor: UIColor.label]
        let secondAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .regular), .foregroundColor: UIColor.label]
        
        let firstString = NSMutableAttributedString(string: text, attributes: firstAttributes)
        let secondString = NSAttributedString(string: episodeName, attributes: secondAttributes)
        firstString.append(secondString)
        
        return firstString
    }
}
