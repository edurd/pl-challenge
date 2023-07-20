//
//  ComicViewModelTests.swift
//  platzy-challengeTests
//
//  Created by Eduardo Hoyos Loli on 20/07/23.
//

import XCTest
@testable import platzy_challenge

final class ComicViewModelTests: XCTestCase {

    var sut: ComicViewModel!
    override func setUpWithError() throws {
        sut = ComicViewModel(client: MarvelApiClientMock())
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_getComics() throws {
        XCTAssertTrue(sut.comics.isEmpty)

        let exp = expectation(description: "Finish fetching comics")
        Task {
            try await sut.getComics()
            exp.fulfill()
        }
        waitForExpectations(timeout: 1)
        XCTAssertEqual(sut.comics.count, 1)
    }

}
