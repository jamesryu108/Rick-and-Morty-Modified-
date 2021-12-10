//
//  String.swift
//  Rick and Morty
//
//  Created by James Ryu on 2021-12-10.
//

import Foundation


extension String {
    ///Simple function in String extension to make localization easier and cleaner
    func localize(comment: String) -> String {
        return NSLocalizedString(self, comment: comment)
    }
}
