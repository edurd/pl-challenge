//
//  ComicDetailView.swift
//  platzy-challenge
//
//  Created by Eduardo Hoyos Loli on 19/07/23.
//

import SwiftUI

struct ComicDetailView: View {
    @StateObject var videoViewModel = ComicDetailViewModel()
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var showNetworkAlert = false
    var comic: Comic
    var comicImageUrl: String {
        guard let path = comic.thumbnail?.path,
              let ext = comic.thumbnail?.ext else {
            return ""
        }
        return path + "." + ext
    }

    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: comicImageUrl), scale: 3) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Image("default_image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(width: 300, height: 400)
                .padding()
                Text("What's about?")
                    .font(.subheadline)
                    .fontWeight(.bold)
                Text(comic.comicDescription ?? "No description available")
                    .font(.subheadline)
                    .foregroundColor(Color.black)
                    .padding(EdgeInsets(top: 5, leading: 20, bottom: 20, trailing: 20))
                NavigationLink(destination: VideosContentView()) {
                    Text("Some Random Videos press here")
                }
                Spacer()
            }
            .navigationTitle(comic.title)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(Color.red, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
        .onChange(of: networkMonitor.isConnected) { connection in
            showNetworkAlert = connection == false
        }
        .alert(
            "Network connection seems to be offline.",
            isPresented: $showNetworkAlert
        ) {}
        
    }
}

struct ComicDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ComicDetailView(comic: Comic(id: 1,
                                     title: "Comic 1",
                                     description: "Long description",
                                     thumbnail: ComicThumbnail(path:"http://i.annihil.us/u/prod/marvel/i/mg/9/40/64a57ab5229cd",
                                                               ext: "jpg")))
    }
}
