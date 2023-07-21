//
//  VideoPlayerContentView.swift
//  platzi-challenge
//
//  Created by Eduardo Hoyos Loli on 19/07/23.
//

import SwiftUI
import AVKit

struct VideoPlayerContentView: View {
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var showNetworkAlert = false
    @State var link: String
    
    var body: some View {
        VStack {
            if let url = URL(string: link) {
                VideoPlayer(player: AVPlayer(url: url))
                .toolbarColorScheme(.dark, for: .navigationBar)
                .toolbarBackground(Color.black, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
            } else {
                Text("No video available")
            }
        }
        .background(Color.black)
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: networkMonitor.isConnected) { connection in
            showNetworkAlert = connection == false
        }
        .alert(
            "Network connection seems to be offline.",
            isPresented: $showNetworkAlert
        ) {}
    }
}

struct VideoPlayerContentView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerContentView(link: "https://player.vimeo.com/external/368064896.sd.mp4?s=62ea7eba7cbffc3d0d10da8630b3635585979411&profile_id=139&oauth2_token_id=57447761")
    }
}
