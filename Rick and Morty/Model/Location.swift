//
//  Location.swift
//  Rick and Morty
//
//  Created by James Ryu on 2021-12-10.
//

import Foundation

struct Location: Codable {
    
    var id: Int
    var name: String
    var type: String
    var dimension: String
    var residents: [String]
    var url: String
    var created: String
}
