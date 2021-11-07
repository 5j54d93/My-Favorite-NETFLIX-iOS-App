//
//  TopPhotoView.swift
//  My Favorite NETFLIX
//
//  Created by 莊智凱 on 2021/11/7.
//

import SwiftUI

struct TopPhotoView: View {
    let video: Video
    @State private var rotateDegree: Double = 0
    var body: some View {
        TabView {
            ForEach(0..<2) { item in
                AsyncImage(url: URL(string: video.photoLink[item])) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .cornerRadius(20)
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
                            .onDisappear {
                                rotateDegree = 0
                            }
                    }
                }
                .padding(.horizontal)
            }
        }
        .tabViewStyle(.page)
        .frame(height: 225)
    }
}
