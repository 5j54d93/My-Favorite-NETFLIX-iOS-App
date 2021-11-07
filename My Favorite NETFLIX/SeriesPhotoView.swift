//
//  SeriesPhotoView.swift
//  My Favorite NETFLIX
//
//  Created by 莊智凱 on 2021/11/7.
//

import SwiftUI

struct SeriesPhotoView: View {
    let video: Video
    @State private var rotateDegree: Double = 0
    var body: some View {
        let columns = Array(repeating: GridItem(spacing: 1), count: 2)
        LazyVGrid(columns: columns, spacing: 9) {
            ForEach(2..<video.photoLink.count) { epsode in
                VStack {
                    NavigationLink {
                        PhotoView(video: video)
                    } label: {
                        AsyncImage(url: URL(string: video.photoLink[epsode])) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ZStack {
                                Color.gray
                                Image(systemName: "rays")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .rotationEffect(.degrees(rotateDegree))
                                    .animation(
                                        .linear(duration: 3.5)
                                            .repeatForever(autoreverses: false),
                                        value: rotateDegree
                                    )
                                    .onAppear{
                                        rotateDegree = 360
                                    }
                            }
                            .frame(height: 120)
                        }
                    }
                    Text("第 " + "\(epsode-1)" + " 集")
                }
            }
        }
        .padding(.horizontal)
    }
}

