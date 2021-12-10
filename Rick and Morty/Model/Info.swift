//
//  Info.swift
//  Rick and Morty
//
//  Created by James Ryu on 2021-12-10.
//

import Foundation

struct Info: Codable {
    var count: Int
    var pages: Int
    var next: String?
    var prev: String?
}
