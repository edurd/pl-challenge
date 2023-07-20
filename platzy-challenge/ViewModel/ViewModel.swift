//
//  ViewModel.swift
//  platzy-challenge
//
//  Created by Eduardo Hoyos Loli on 14/07/23.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var comics = [Comic]()
    var apiClient = MarvelApiClient()
    var page = 0
    var offset = 0
    var limit = 50

    func getCharacters() {

    }

    @MainActor
    func getComics() async throws {
        let newComics = try await apiClient.getComics(withLimit: limit, offset: offset)
        comics.append(contentsOf: newComics)
    }

    @MainActor
    func reachedToLast(comic c: Comic) {
        
        let thresholdIndex = comics.index(comics.endIndex, offsetBy: -5)
        guard comics.firstIndex(where: { $0.id == c.id }) == thresholdIndex else {
            return
        }
        page += 1
        offset = limit * page
        Task {
            try await getComics()
        }
    }
}
