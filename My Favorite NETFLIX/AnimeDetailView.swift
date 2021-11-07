//
//  AnimeDetailView.swift
//  My Favorite NETFLIX
//
//  Created by 莊智凱 on 2021/11/3.
//

import SwiftUI

struct AnimeDetailView: View {
    let video: Video
    var body: some View {
        ScrollView(.vertical) {
            TopPhotoView(video: video)
            
            Text(video.year + "・" + video.maturityNum + "・" + video.time)
            
            InfoView(video: video)
            
            MusicSectionView(video: video)
            
            ExternalLinkView(video: video)
                .padding(.bottom, 5)
        }
        .navigationTitle(video.name)
    }
}
