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
        var urlComponents = URLComponents(string: Constants.getComics)
        urlComponents?.queryItems = [URLQueryItem(name: "apikey", value: Constants.marvelApikey),
                                     URLQueryItem(name: "hash", value: Constants.marvelHash),
                                     URLQueryItem(name: "ts", value: Constants.marvelTs),
                                     URLQueryItem(name: "title", value: Constants.marvelDefaultSearch),
                                     URLQueryItem(name: "limit", value: "\(limit)"),
                                     URLQueryItem(name: "offset", value: "\(offset)"),
                                     URLQueryItem(name: "noVariants", value: "true")]
        guard let url = urlComponents?.url else {
            return []
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let comicModel = try JSONDecoder().decode(ComicResponse.self, from: data)
        return comicModel.data.results
    }
}
