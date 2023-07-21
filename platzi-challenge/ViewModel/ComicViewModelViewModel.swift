//
//  ComicViewModel.swift
//  platzi-challenge
//
//  Created by Eduardo Hoyos Loli on 14/07/23.
//

import Foundation
import RealmSwift

class ComicViewModel: ObservableObject {

    var apiClient : MarvelApiClientProtocol
    
    var comics: Results<Comic>
    var page = 0
    var offset = 0
    var limit = 50

    init(client: MarvelApiClientProtocol) {
        apiClient = client
        let realm = try! Realm()
        comics = realm.objects(Comic.self)
    }

    @MainActor
    func getComics() async throws {
        let newComics = try await apiClient.getComics(withLimit: limit, offset: offset)
        let realm = try! await Realm()
        try! realm.write {
            realm.add(newComics, update: .all)
        }
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
