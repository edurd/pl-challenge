//
//  ContentView.swift
//  platzy-challenge
//
//  Created by Eduardo Hoyos Loli on 14/07/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        List(viewModel.comics, id: \.id) { comic in
            ComicRowView(comic: comic)
        }
        .onAppear {
            Task {
                await viewModel.getComics()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
