//
//  Comic.swift
//  platzy-challenge
//
//  Created by Eduardo Hoyos Loli on 17/07/23.
//

import Foundation
import RealmSwift

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

class Comic: Object, Identifiable, Decodable {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var title: String
    @Persisted var comicDescription: String?
    @Persisted var thumbnail: ComicThumbnail?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case comicDescription = "description"
        case thumbnail
    }

    override init() {
        super.init()
    }

    init(id: Int, title: String, description: String, thumbnail: ComicThumbnail) {
        super.init()
        self.id = id
        self.title = title
        self.comicDescription = description
        self.thumbnail = thumbnail
    }

    required init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<Comic.CodingKeys> = try decoder.container(keyedBy: Comic.CodingKeys.self)
        
        self._id = try container.decode(Persisted<Int>.self, forKey: Comic.CodingKeys.id)
        self.title = try container.decode(String.self, forKey: Comic.CodingKeys.title)
        self.comicDescription = try container.decodeIfPresent(String.self, forKey: Comic.CodingKeys.comicDescription)
        self.thumbnail = try container.decodeIfPresent(ComicThumbnail.self, forKey: Comic.CodingKeys.thumbnail)
    }
    
}

class ComicThumbnail: Object, Decodable {
    @Persisted var path: String?
    @Persisted var ext: String?
    
    enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }

    override init() {
        super.init()
    }

    init(path: String, ext: String) {
        super.init()
        self.path = path
        self.ext = ext
    }

    required init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<ComicThumbnail.CodingKeys> = try decoder.container(keyedBy: ComicThumbnail.CodingKeys.self)
        
        self.path = try container.decodeIfPresent(String.self, forKey: ComicThumbnail.CodingKeys.path)
        self.ext = try container.decodeIfPresent(String.self, forKey: ComicThumbnail.CodingKeys.ext)
        
        
    }
    
}
