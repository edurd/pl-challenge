//
//  PexelsApiClientMock.swift
//  platzi-challengeTests
//
//  Created by Eduardo Hoyos Loli on 20/07/23.
//

import Foundation
@testable import platzi_challenge

class PexelsApiClientMock: PexelsApiClientProtocol {

    func getRandomVideos(withQuery text: String) async throws -> [Video] {
        return [Video(id: 1,
                      image: "image",
                      videoFiles: [VideoFile(id: 1,
                                             quality: "sd",
                                             fileType: "mp4",
                                             link: "link")])]
    }
}
