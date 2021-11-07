//
//  SeriesDetailView.swift
//  My Favorite NETFLIX
//
//  Created by 莊智凱 on 2021/11/4.
//

import SwiftUI

struct SeriesDetailView: View {
    let video: Video
    var body: some View {
        ScrollView(.vertical) {
            TopPhotoView(video: video)
            
            Text(video.year + "・" + video.maturityNum + "・" + video.time)
            
            InfoView(video: video)
            
            HStack {
                Label("Photos", systemImage: "photo")
                    .foregroundColor(.gray)
                Spacer()
            }
            .padding(.horizontal)
            
            SeriesPhotoView(video: video)
            
            ExternalLinkView(video: video)
                .padding(.bottom, 5)
        }
        .navigationTitle(video.name)
    }
}
