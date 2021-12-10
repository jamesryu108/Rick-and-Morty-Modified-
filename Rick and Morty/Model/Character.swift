//
//  Character.swift
//  Rick and Morty
//
//  Created by James Ryu on 2021-12-10.
//

import Foundation

struct Character: Codable {
    
    var info: Info
    var results: [CharacterResults]
}
