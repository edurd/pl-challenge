//
//  Character.swift
//  platzy-challenge
//
//  Created by Eduardo Hoyos Loli on 17/07/23.
//

import Foundation

struct Character: Decodable {
    var id: String
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
    }
}
