//
//  VideoViewModel.swift
//  platzy-challenge
//
//  Created by Eduardo Hoyos Loli on 19/07/23.
//

import Foundation
import RealmSwift

class VideoViewModel: ObservableObject {
    @Published var videos = [Video]()

    var apiClient: PexelsApiClientProtocol
    
    init(client: PexelsApiClientProtocol) {
        apiClient = client
    }
    
    @MainActor
    func getVideos(withQuery text: String) async throws {
        let videosFromService = try await apiClient.getRandomVideos(withQuery: text)
        videos = videosFromService
    }
}
