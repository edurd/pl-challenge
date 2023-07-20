//
//  Video.swift
//  platzy-challenge
//
//  Created by Eduardo Hoyos Loli on 19/07/23.
//

import Foundation

struct VideoResponse: Decodable {
    var videos: [Video]
}

struct Video: Decodable {
    var id: Int
    var image: String?
    var videoFiles: [VideoFile]
    
    enum CodingKeys: String, CodingKey {
        case id
        case image
        case videoFiles = "video_files"
    }
}

struct VideoFile: Decodable {
    var id: Int
    var quality: String
    var fileType: String
    var link: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case quality
        case fileType = "file_type"
        case link
    }
}
