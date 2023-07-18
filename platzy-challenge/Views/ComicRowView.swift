//
//  ComicRowView.swift
//  platzy-challenge
//
//  Created by Eduardo Hoyos Loli on 17/07/23.
//

import SwiftUI

struct ComicRowView: View {
    var comic: Comic
    
    var body: some View {
        ZStack(alignment: .leading) {
            let path = comic.thumbnail?.path ?? ""
            let ext = comic.thumbnail?.ext ?? ""
            AsyncImage(url: URL(string: path + "." + ext),
                       scale: 2)
            HStack {
                VStack(alignment: .leading) {
                    Spacer()
                    Text(comic.title)
                        .font(.title)
                        .fontWeight(Font.Weight.bold)
                        .foregroundColor(Color.white)
                    Text(comic.description ?? "")
                        .font(.subheadline)
                        .foregroundColor(Color.white)
                }
                Spacer()
            }
            .padding(10)
            .background(Color.gray.opacity(0.5))
        }
        .padding(5)
    }
}

struct ComicRowView_Previews: PreviewProvider {
    static var previews: some View {
        ComicRowView(comic: Comic(id: 1,
                                  title: "Comic 1",
                                  description: "Long description",
                                  thumbnail: ComicThumbnail(path:"http://i.annihil.us/u/prod/marvel/i/mg/9/40/64a57ab5229cd",
                                                            ext: "jpg")))
        .previewLayout(.fixed(width: 400, height: 200))
    }
}
