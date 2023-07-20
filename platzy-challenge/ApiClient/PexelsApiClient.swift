//
//  PexelsApiClient.swift
//  platzy-challenge
//
//  Created by Eduardo Hoyos Loli on 19/07/23.
//

import Foundation

class PexelsApiClient {
    
    func getRandomVideos(withQuery text: String) async throws -> [Video] {
        guard let url = URL(string: Constants.getRandomVideos + text) else {
            return []
        }
        var request = URLRequest(url: url)
        request.setValue(Constants.pexelsApiKey, forHTTPHeaderField: "Authorization")
        let (data, _) = try await URLSession.shared.data(for: request)
        let videoModel = try JSONDecoder().decode(VideoResponse.self, from: data)
        return videoModel.videos
    }
}
