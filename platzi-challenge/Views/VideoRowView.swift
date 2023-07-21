//
//  VideoRowView.swift
//  platzi-challenge
//
//  Created by Eduardo Hoyos Loli on 19/07/23.
//

import SwiftUI

struct VideoRowView: View {
    @State var video: Video
    var body: some View {
        HStack {
            if let link = video.image, let url = URL(string: link){
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Image("default_image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            } else {
                Image("default_image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .padding(20)
    }
}

struct VideoRowView_Previews: PreviewProvider {
    static var previews: some View {
        VideoRowView(video: Video(id: 1, image: "", videoFiles: [VideoFile(id: 1, quality: "sd", fileType: "mp4", link: "")]))
    }
}
