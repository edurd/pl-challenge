//
//  ComicViewModelTests.swift
//  platzi-challengeTests
//
//  Created by Eduardo Hoyos Loli on 20/07/23.
//

import XCTest
@testable import platzi_challenge

final class ComicViewModelTests: XCTestCase {

    var sut: ComicViewModel!
    override func setUpWithError() throws {
        sut = ComicViewModel(client: MarvelApiClientMock())
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_getComics() throws {

        let exp = expectation(description: "Finish fetching comics")
        Task {
            try await sut.getComics()
            exp.fulfill()
        }
        waitForExpectations(timeout: 2)
        XCTAssertGreaterThan(sut.comics.count, 0)
    }

}
