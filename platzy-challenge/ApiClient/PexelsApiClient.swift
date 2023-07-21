//
//  PexelsApiClient.swift
//  platzy-challenge
//
//  Created by Eduardo Hoyos Loli on 19/07/23.
//

import Foundation

protocol PexelsApiClientProtocol {
    func getRandomVideos(withQuery text: String) async throws -> [Video]
}

class PexelsApiClient: PexelsApiClientProtocol {
    
    func getRandomVideos(withQuery text: String) async throws -> [Video] {
        var urlComponents = URLComponents(string: Constants.getRandomVideos)
        urlComponents?.queryItems = [URLQueryItem(name: "query", value: text)]
        guard let url = urlComponents?.url else {
            return []
        }
        var request = URLRequest(url: url)
        request.setValue(Constants.pexelsApiKey, forHTTPHeaderField: "Authorization")
        let (data, _) = try await URLSession.shared.data(for: request)
        let videoModel = try JSONDecoder().decode(VideoResponse.self, from: data)
        return videoModel.videos
    }
}
