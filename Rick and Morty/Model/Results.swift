//
//  Results.swift
//  Rick and Morty
//
//  Created by James Ryu on 2021-12-10.
//

import Foundation

struct Results: Codable {
    
    let uuid = UUID()

    private enum CodingKeys : String, CodingKey { case id, name, airDate, episode, characters, url, created }
    
    var id: Int
    var name: String
    var airDate: String
    var episode: String
    var characters: [String]
    var url: String
    var created: String
}

extension Results : Hashable {
    static func ==(lhs: Results, rhs: Results) -> Bool {
        return lhs.uuid == rhs.uuid
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
}
