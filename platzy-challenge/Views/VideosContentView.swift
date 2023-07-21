//
//  VideosContentView.swift
//  platzy-challenge
//
//  Created by Eduardo Hoyos Loli on 19/07/23.
//

import SwiftUI

struct VideosContentView: View {
    @StateObject var viewModel = VideoViewModel(client: PexelsApiClient())
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var showNetworkAlert = false
    @State private var query: String = ""
    @State var isLoading: Bool = false

    var body: some View {
        VStack {
            HStack{
                TextField("Eg. Cats", text: $query)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Search") {
                    isLoading.toggle()
                    Task {
                        isLoading = true
                        try await viewModel.getVideos(withQuery: query)
                        isLoading = false
                    }
                }
            }
            .padding(20)
            if isLoading {
                ProgressView("Loading")
            } else {
                ProgressView("Loading").hidden()
            }
            List {
                ForEach(viewModel.videos, id: \.id) { video in
                    if let link = video.videoFiles.first?.link {
                        NavigationLink(destination: VideoPlayerContentView(link: link)) {
                            VideoRowView(video: video)
                                .frame(maxWidth: .infinity,
                                       maxHeight: 150)
                        }
                    }
                }
            }
        }
        .navigationTitle("Video searcher")
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(Color.red, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .onChange(of: networkMonitor.isConnected) { connection in
            showNetworkAlert = connection == false
        }
        .alert(
            "Network connection seems to be offline.",
            isPresented: $showNetworkAlert
        ) {}
    }
}

struct VideosContentView_Previews: PreviewProvider {
    static var previews: some View {
        VideosContentView()
    }
}
