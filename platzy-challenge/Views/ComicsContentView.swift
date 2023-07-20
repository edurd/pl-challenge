//
//  ComicsContentView.swift
//  platzy-challenge
//
//  Created by Eduardo Hoyos Loli on 14/07/23.
//

import SwiftUI

struct ComicsContentView: View {

    @StateObject var viewModel = ViewModel()
    @State private var hasAppeared = false

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.comics, id: \.id) { comic in
                    NavigationLink(destination: ComicDetailView(comic: comic)) {
                        ComicRowView(comic: comic)
                            .onAppear {
                                viewModel.reachedToLast(comic: comic)
                            }
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
    }
}

struct ComicsContentView_Previews: PreviewProvider {
    static var previews: some View {
        ComicsContentView()
    }
}
