//
//  ComicRowView.swift
//  platzi-challenge
//
//  Created by Eduardo Hoyos Loli on 17/07/23.
//

import SwiftUI

struct ComicRowView: View {
    var comic: Comic
    var comicImageUrl: String {
        guard let path = comic.thumbnail?.path, let ext = comic.thumbnail?.ext else {
            return ""
        }
        return path + "." + ext
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: URL(string: comicImageUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Image("default_image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .aspectRatio(contentMode: .fit)
            HStack {
                VStack(alignment: .leading) {
                    Text(comic.title)
                        .font(.title)
                        .fontWeight(Font.Weight.bold)
                        .foregroundColor(Color.white)
                }
                .frame(height: 100)
                Spacer()
            }
            .padding(10)
            .background(Color.black.opacity(0.6))
        }
    }
}

struct ComicRowView_Previews: PreviewProvider {
    static var previews: some View {
        ComicRowView(comic: Comic(id: 1,
                                  title: "Comic 1",
                                  description: "Long description",
                                  thumbnail: ComicThumbnail(path:"http://i.annihil.us/u/prod/marvel/i/mg/9/40/64a57ab5229cd",
                                                            ext: "jpg")))
        .previewLayout(.fixed(width: 400, height: 600))
    }
}
