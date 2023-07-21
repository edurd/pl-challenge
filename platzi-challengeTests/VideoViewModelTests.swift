//
//  VideoViewModelTests.swift
//  platzi-challengeTests
//
//  Created by Eduardo Hoyos Loli on 20/07/23.
//

import XCTest
@testable import platzi_challenge

final class VideoViewModelTests: XCTestCase {

    var sut: VideoViewModel!

    override func setUpWithError() throws {
        sut = VideoViewModel(client: PexelsApiClientMock())
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_getVideos() throws {
        XCTAssertTrue(sut.videos.isEmpty)

        let exp = expectation(description: "Finish fetching videos")
        Task {
            try await sut.getVideos(withQuery: "query")
            exp.fulfill()
        }
        waitForExpectations(timeout: 1)
        XCTAssertEqual(sut.videos.count, 1)
    }

}
