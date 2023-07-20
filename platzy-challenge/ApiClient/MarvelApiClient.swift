//
//  MarvelApiClient.swift
//  platzy-challenge
//
//  Created by Eduardo Hoyos Loli on 17/07/23.
//

import Foundation

protocol MarvelApiClientProtocol {
    func getComics(withLimit limit: Int, offset: Int) async throws -> [Comic]
}

class MarvelApiClient: MarvelApiClientProtocol {
    
    func getComics(withLimit limit: Int, offset: Int) async throws -> [Comic] {
        let paging = "&limit=\(limit)&offset=\(offset)"
        guard let url = URL(string: Constants.getComics + paging + "&noVariants=true") else {
            return []
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let comicModel = try JSONDecoder().decode(ComicResponse.self, from: data)
        return comicModel.data.results
    }
}
