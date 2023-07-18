//
//  MarvelApiClient.swift
//  platzy-challenge
//
//  Created by Eduardo Hoyos Loli on 17/07/23.
//

import Foundation

class MarvelApiClient {
    
    @MainActor
    func getComics() async -> [Comic] {
        guard let url = URL(string: Constants.getComics) else {
            return []
        }
        let (data, _) = try! await URLSession.shared.data(from: url)
        let comicModel = try! JSONDecoder().decode(ComicResponse.self, from: data)
        return comicModel.data.results
    }
}
