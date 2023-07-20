//
//  MarvelApiClientMock.swift
//  platzy-challengeTests
//
//  Created by Eduardo Hoyos Loli on 20/07/23.
//

@testable import platzy_challenge

class MarvelApiClientMock: MarvelApiClientProtocol {

    func getComics(withLimit limit: Int, offset: Int) async throws -> [Comic] {
        return [Comic(id: 1, title: "Comic 1", description: "Description")]
    }
}
