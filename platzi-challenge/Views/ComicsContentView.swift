//
//  ComicsContentView.swift
//  platzi-challenge
//
//  Created by Eduardo Hoyos Loli on 14/07/23.
//

import SwiftUI
import RealmSwift

struct ComicsContentView: View {

    @StateObject var viewModel = ComicViewModel(client: MarvelApiClient())
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @ObservedResults(Comic.self) var comics
    @State private var showNetworkAlert = false
    @State private var hasAppeared = false

    var body: some View {
        NavigationView {
            List {
                ForEach(comics, id: \.id) { comic in
                    NavigationLink(destination: ComicDetailView(comic: comic)) {
                        ComicRowView(comic: comic)
                            .onAppear {
                                viewModel.reachedToLast(comic: comic)
                            }
                            .accessibilityIdentifier("\(comic.id)")
                    }
                }
            }
            .onAppear {
                Task {
                    guard !hasAppeared else { return }
                    hasAppeared = true
                    try await viewModel.getComics()
                }
            }
            .navigationTitle("Comics")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(Color.red, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
        .onChange(of: networkMonitor.isConnected) { conn in
            showNetworkAlert = conn == false
        }
        .alert(
            "Network connection seems to be offline.",
            isPresented: $showNetworkAlert
        ) {}
    }
}

struct ComicsContentView_Previews: PreviewProvider {
    static var previews: some View {
        ComicsContentView()
            .environmentObject(NetworkMonitor())
    }
}
