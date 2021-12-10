//
//  CharacterResults.swift
//  Rick and Morty
//
//  Created by James Ryu on 2021-12-10.
//

import Foundation

struct CharacterResults: Codable {
    
    var id: Int
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var origin: Origin
    var location: CharacterLocation
    var image: String
    var episode: [String]
    var url: String
    var created: String
}
