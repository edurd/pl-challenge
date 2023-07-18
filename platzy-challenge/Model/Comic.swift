//
//  Comic.swift
//  platzy-challenge
//
//  Created by Eduardo Hoyos Loli on 17/07/23.
//

import Foundation

struct ComicResponse: Decodable {
    var code: Int
    var status: String
    var data: ComicData
}
struct ComicData: Decodable {
    var offset: Int
    var limit: Int
    var total: Int
    var count: Int
    var results: [Comic]
}
struct Comic: Decodable {
    var id: Int
    var title: String
    var description: String?
    var thumbnail: ComicThumbnail?
    
}
struct ComicThumbnail: Decodable, Equatable {
    var path: String?
    var ext: String?
    
    enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }
    
}
