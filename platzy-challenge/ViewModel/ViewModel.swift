//
//  ViewModel.swift
//  platzy-challenge
//
//  Created by Eduardo Hoyos Loli on 14/07/23.
//

import Foundation

class ViewModel: ObservableObject {
    var apiClient = MarvelApiClient()
    @Published var comics = [Comic]()

    func getCharacters() {
//        characters = []
    }

    @MainActor
    func getComics() async {
        comics = await apiClient.getComics()
    }
}
